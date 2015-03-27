`import Ember from 'ember'`

HistogramChartComponent = Ember.Component.extend({
  # The data to drive the histogram, just feed a raw Ember data
  data: (-> []).property()
  # What field are we binning by, defaults to id
  binningField: null
  # If we are working by dates
  byDate: false
  # If we are working by dates, this is the bin width
  # Options include all d3 time intervals defined at
  # https://github.com/mbostock/d3/wiki/Time-Intervals#intervals
  timeSpan: 'day'

  # Field to rollup by, default just counts the elements
  # If you had a value field you wanted to sum passing that in here would work.
  # E.g., to get the number of comments a blog post had, use "comments.length"
  rollupBy: null

  didInsertElement: ->
    svg = d3.select("##{@elementId}").select("svg")
    @padding = 5
    @width = 600 - @padding * 2
    @height = 200 - @padding * 2

    # FIXME: Replace 30 days prior to current day with selected date range
    xCurrent = new Date()
    xStartOffset = d3.time.day.offset(xCurrent, -30)
    xStopOffset = d3.time.day.offset(xCurrent, 1)

    @xScale = d3.time.scale()
      .domain([xStartOffset, xStopOffset])
      .rangeRound([0, @width])

    xAxis = d3.svg.axis()
      .scale(@xScale)
      .orient("bottom")
      .ticks(d3.time.days, 1)
      .tickFormat(d3.time.format('%e'))
      .tickSize(4,0)
      .tickPadding(2)

    test = @customBinnedData(@get('data').toArray(), "date", "server.id")
    data = @customExtractData(test)
    @g = svg.append("g")
    @g.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(" + -1*@padding + "," + (@height - @padding) + ")")
      .call(xAxis)
    .selectAll("text")
      .attr("y", 8)
      .attr("x", 6)
      .style("text-anchor", "start")

    @setupScale(data)
    @g.selectAll("rect")
      .transition()
      .duration(1000)
      .style("fill", (d) => @colorScale( d.id ))
      .attr("x", (d) => @xScale( d.date ))
      .attr("y", (d) => @height - @heightScale( d.value ))
      .attr("width", 10 )
      .attr("height", (d) => @heightScale( d.value ))

  binnedData: (models, rollup, binningField="id", byDate=false, timeSpan="day") ->
    bins = d3.nest()
      .key((d) ->
        if byDate
          return d3.time[timeSpan](d.get(binningField))
        return d.get(binningField)
      )
    bins.rollup((d) -> d3.sum(d, (g) -> g.get(rollup) ))
    bins.entries(models.toArray())

  customBinnedData: (models, binningField="date", secondBinning="server.id") ->
    bins = d3.nest()
      .key((d) ->
        return new Date(d.get(binningField).getTime()).setHours(2,0,0,0)
      ).key((d) -> return d.get(secondBinning))
    bins.entries(models)

  customExtractData: (models) ->
    offsets = {}
    extractedData = []
    models.map (runsByDate) =>
      runsByDate.values.map (runsByServer) =>
        run = runsByServer.values[0]
        syncedTime = new Date(run.get('date').getTime()).setHours(2,0,0,0)
        if runsByServer.values.length > 1
          values = d3.sum(runsByServer.values, (v) -> v.get('testResults.length'))
        else
          values = run.get('testResults.length')
        offsets[syncedTime] ?= 0
        offsets[syncedTime] += values
        extraction =
          id: @servers.indexOf(run.get('server.id'))
          value: values
          date: syncedTime
          offset: offsets[syncedTime] - values
        extractedData.push extraction
    extractedData

  setupScale: (data) ->
    @g.selectAll("rect")
      .transition()
      .duration(1000)
      .attr("y", @height)
      .attr("height", 0)
      .remove()
    @g.selectAll(".histogram-bar-label")
      .transition()
      .duration(1000)
      .attr("y", @height)
      .remove()

    @barScale = d3.scale.ordinal()
      .domain(d3.range(0, data.length))
      .rangeRoundBands([@padding, @width], (@bandPadding||0))
    @colorScale = d3.scale.category20()
      .domain([0..19])
    @stacks = @binnedData(@get('data'), "testResults.length", "date", true )
    @heightScale = d3.scale.linear()
      .domain([0, d3.max(@stacks, (d) -> d.values )])
      .range([@padding+1, @height-12])
    gEnter = @g.selectAll("rect")
      .data(data)
      .enter()
    gEnter.append("rect")
      .style("fill", (d) => @colorScale( d.id ))
      .attr("x", (d) => @xScale( d.date ))
      .attr("y", (d) => @height )
      .attr("width", 10 )
      .attr("height", 0)
    @g.selectAll(".histogram-bar-label")
      .data(@stacks)
      .enter()
      .append("svg:text")
        .attr("class", "histogram-bar-label")
        .attr("x", (d) => @xScale( new Date(d.key).setHours(4,0,0,0) ))
        .attr("y", (d) -> 0)
        .text('0')

  updateGraph:(->
    test = @customBinnedData(@get('data').toArray(), "date", "server.id")
    data = @customExtractData(test)
    @setupScale(data)
    @g.selectAll("rect")
      .data(data)
      .transition()
      .duration(1000)
      .style("fill", (d) =>
        @colorScale( d.id ))
      .attr("x", (d) =>
        @xScale( d.date ))
      .attr("y", (d) =>
        @height - @heightScale( d.value + d.offset ))
      .attr("width", 10 )
      .attr("height", (d) =>
        @heightScale( d.value ))

    @g.selectAll(".histogram-bar-label")
      .data( () => @stacks)
      .transition()
      .duration(1000)
      .attr("x", (d) => @xScale( new Date(d.key).setHours(4,0,0,0) ))
      .attr("y", (d) => (@height - @heightScale( d.values )) - 2 )
      .text((d) -> d.values)

    ).observes('data')
})

`export default HistogramChartComponent`
