`import Ember from 'ember'`

HistogramChartComponent = Ember.Component.extend({
  # The data to drive the histogram, just feed a raw Ember data
  data: []
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
    # @bins = d3.nest()
    #   .key((d) =>
    #     if @byDate
    #       return d3.time[@timeSpan||'day'](d.get(@binningField||"id"))
    #     return d.get(@binningField||"id")
    #   )
    # if @byDate
    #   @bins = @bins.key((d) ->
    #     d.get("id")
    #   )


    # if @rollupBy
    #   @bins.rollup((d) => #d3.sum(d, (g) => g.get(@rollupBy) )
    #     rollup: d3.sum(d, (g) => g.get(@rollupBy) )
    #     id: d[0].get('id')
    #     date: d[0].get('date').setHours(0,0,0,0)
    #   )
    # else
    #   @bins.rollup((d) ->
    #     d.length
    #   )

    xStart = new Date(2015, 2, 1)
    xStop = new Date(2015, 3, 1)
    xStartOffset = d3.time.day.offset(xStart, 0)
    xStopOffset = d3.time.day.offset(xStop, -1)

    @xScale = d3.time.scale()
      .domain([xStartOffset, xStopOffset])
      .rangeRound([0, @width])
      # .range([xStartOffset, xStopOffset].map(d3.time.scale()
      #   .domain([xStart, xStop])
      #   .range([0, @width])))

    xAxis = d3.svg.axis()
      .scale(@xScale)
      .orient("bottom")
      .ticks(d3.time.days, 1)
      .tickFormat(d3.time.format('%e'))
      .tickSize(4,0)
      .tickPadding(2)

    # data = @extractData(@data.toArray(), @rollupBy) #@bins.entries(@data.toArray())
    test = @customBinnedData(@data.toArray(), "date", "server.id")
    data = @customExtractData(test)
    @g = svg.append("g")
    @g.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(" + -1*@padding + "," + (@height - @padding) + ")")
      .call(xAxis)
    .selectAll("text")
      .attr("y", 6)
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

  # getNestedSum: (datum) -> d3.sum(datum.values, (v) -> v.values.rollup)

  # getNestedId: (datum) -> d3.sum(datum.values, (v) -> v.values.rollup)

  # extractData: (models, rollup) ->
  #   offsets = {}
  #   paddingCount = {}
  #   # index = 0
  #   models.map (m) ->
  #     syncedTime = m.get('date').setHours(8,0,0,0)
  #     offsets[syncedTime] ?= 0
  #     offsets[syncedTime] += m.get(rollup)
  #     paddingCount[syncedTime] ?= 0
  #     paddingCount[syncedTime] += 1
  #     # console.log m
  #     extracted =
  #       id: m.get('server.id')
  #       value: m.get(rollup)
  #       date: syncedTime
  #       offset: offsets[syncedTime] - m.get(rollup)
  #       padding: paddingCount[syncedTime]-1
  #       # index: index++
  #
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
        return d.get(binningField).setHours(2,0,0,0)
      ).key((d) -> return d.get(secondBinning))
    bins.entries(models)

  customExtractData: (models) ->
    offsets = {}
    extractedData = []
    models.map (runsByDate) =>
      runsByDate.values.map (runsByServer) =>
        run = runsByServer.values[0]
        syncedTime = run.get('date').setHours(2,0,0,0)
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

    @barScale = d3.scale.ordinal()
      .domain(d3.range(0, data.length))
      .rangeRoundBands([@padding, @width], (@bandPadding||0))
    @colorScale = d3.scale.category20()
      .domain([0..19])
    stacks = @binnedData(@data, "testResults.length", "date", true )
    @heightScale = d3.scale.linear()
      .domain([0, d3.max(stacks, (d) -> d.values )])
      .range([@padding+1, @height])
    gEnter = @g.selectAll("rect")
      .data(data)
      .enter()
    # # console.log data
    gEnter.append("rect")
      .style("fill", (d) => @colorScale( d.id ))
      .attr("x", (d) => @xScale( d.date ))
      .attr("y", (d) => @height )
      .attr("width", 10 )
      .attr("height", 0)


  updateGraph:(->
    # data = @extractData(@data.toArray(), @rollupBy) #@bins.entries(@data.toArray())
    test = @customBinnedData(@data.toArray(), "date", "server.id")
    data = @customExtractData(test)
    # console.log data
    # debugger
    @setupScale(data)
    @g.selectAll("rect")
      .data(data)
      .transition()
      .duration(1000)
      .style("fill", (d) =>
        # console.log "filling #{d.id}-#{d.value} with #{@colorScale(d.id)}"
        @colorScale( d.id ))
      .attr("x", (d) =>
        # console.log "positioning #{d.id}-#{d.date} with #{@xScale(d.date)}"
        @xScale( d.date ))
      .attr("y", (d) =>
        # console.log d
        # console.log "positioning #{d.id}-#{d.value}-#{d.offset} with #{@heightScale(d.value)}, #{@heightScale( d.offset )}, #{@height - @heightScale( d.value + d.offset )}"
        @height - @heightScale( d.value + d.offset ))
      .attr("width", 10 )
      .attr("height", (d) =>
        # console.log "setting #{d.id}-#{d.value} with #{@heightScale( d.value )}"
        @heightScale( d.value ))
    ).observes('data')
})

`export default HistogramChartComponent`
