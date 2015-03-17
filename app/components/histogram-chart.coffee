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
    @bins = d3.nest()
      .key((d) =>
        if @byDate
          return d3.time[@timeSpan||'day'](d.get(@binningField||"id"))
        return d.get(@binningField||"id")
      )
    # if @byDate
    #   @bins = @bins.key((d) ->
    #     d.get("id")
    #   )


    if @rollupBy
      @bins.rollup((d) => #d3.sum(d, (g) => g.get(@rollupBy) )
        rollup: d3.sum(d, (g) => g.get(@rollupBy) )
        id: d[0].get('id')
        date: d[0].get('date').setHours(0,0,0,0)
      )
    else
      @bins.rollup((d) ->
        d.length
      )

    xStart = new Date(2015, 2, 12)
    xStop = new Date(2015, 2, 18)
    xStartOffset = d3.time.day.offset(xStart, -1)
    xStopOffset = d3.time.day.offset(xStop, +1)

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
      .tickFormat(d3.time.format('%a %d'))
      .tickSize(0)
      .tickPadding(8)

    data = @extractData(@data, @rollupBy) #@bins.entries(@data.toArray())
    @g = svg.append("g")
    @g.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + @height + ")")
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

  getNestedSum: (datum) -> d3.sum(datum.values, (v) -> v.values.rollup)

  # getNestedId: (datum) -> d3.sum(datum.values, (v) -> v.values.rollup)

  extractData: (models, rollup) ->
    offsets = {}
    models.toArray().map (m) ->
      offsets[m.get('date').setHours(0,0,0,0)] ?= 0
      offsets[m.get('date').setHours(0,0,0,0)] += m.get(rollup)
      # console.log m
      id: m.get('server.id')
      value: m.get(rollup)
      date: m.get('date').setHours(0,0,0,0)
      offset: offsets[m.get('date').setHours(0,0,0,0)] - m.get(rollup)

  binnedData: (models, rollup, binningField="id", byDate=false, timeSpan="day") ->
    bins = d3.nest()
      .key((d) ->
        if byDate
          return d3.time[timeSpan](d.get(binningField))
        return d.get(binningField)
      )
    bins.rollup((d) -> d3.sum(d, (g) -> g.get(rollup) ))
    bins.entries(models.toArray())

  setupScale: (data) ->
    @g.selectAll("rect")
      .transition()
      .duration(1000)
      .attr("height", 0)
      .remove()

    @barScale = d3.scale.ordinal()
      .domain(d3.range(0, data.length))
      .rangeRoundBands([@padding, @width], (@bandPadding||0))
    @colorScale = d3.scale.category20()
      .domain([@data.getEach('id')])

    stacks = @binnedData(@data, "testResults.length", "date", true )
    @heightScale = d3.scale.linear()
      .domain([0, d3.max(stacks, (d) -> d.values )])
      .range([@padding, @height])
    gEnter = @g.selectAll("rect")
      .data(data)
      .enter()
    # console.log data
    gEnter.append("rect")
      .transition()
      .duration(1000)
      .style("fill", (d) => @colorScale( d.id ))
      .attr("x", (d) => @xScale( d.date ))
      .attr("y", (d) => @height )
      .attr("width", 10 )
      .attr("height", 0)


  updateGraph:(->
    data = @extractData(@data, @rollupBy) #@bins.entries(@data.toArray())
    console.log data
    @setupScale(data)
    @g.selectAll("rect")
      .data(data)
      .transition()
      .duration(1000)
      .style("fill", (d) => @colorScale( d.id ))
      .attr("x", (d) => @xScale( d.date ))
      .attr("y", (d) => @height - @heightScale( d.value + d.offset ))
      .attr("width", 10 )
      .attr("height", (d) => @heightScale( d.value ))
    ).observes('data')
})

`export default HistogramChartComponent`
