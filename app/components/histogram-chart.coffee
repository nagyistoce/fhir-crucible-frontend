`import Ember from 'ember'`

HistogramChartComponent = Ember.Component.extend({
  # The data to drive the histogram, just feed a raw Ember data
  data: []
  # What field are we binning by, defaults to id
  binningField: null
  # If we are working by dates
  byDate: false
  # If we are working by dates, this is the bin width
  # Options include all d3 time intervals defined at https://github.com/mbostock/d3/wiki/Time-Intervals#intervals
  timeSpan: 'day'

  # Field to rollup by, default just counts the elements
  # If you had a value field you wanted to sum passing that in here would work.
  # For example, to get the number of comments a blog post had you could use "comments.length"
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


    if @rollupBy
      @bins.rollup((d) =>
        d3.sum(d, (g) =>
          g.get(@rollupBy)
        )
      )
    else
      @bins.rollup((d) =>
        d.length
      )

    data = @bins.entries(@data.toArray())
    @g = svg.append("g")
    @setupScale(data)
    @g.selectAll("rect")
      .transition()
      .style("fill", '#7F9FC5')
      .attr("x", (d,i) => @barScale(i))
      .attr("y", (d) => @height - @heightScale(d.values))
      .attr("width", @barScale.rangeBand())
      .attr("height", (d) => @heightScale(d.values))

  setupScale: (data) ->
    @g.selectAll("rect").remove()
    @barScale = d3.scale.ordinal()
      .domain(d3.range(0, data.length))
      .rangeRoundBands([@padding, @width], (@bandPadding||0))
    @heightScale = d3.scale.linear()
      .domain([0, d3.max(data, (d) -> d.values)])
      .range([@padding, @height])
    gEnter = @g.selectAll("rect")
      .data(data)
      .enter()
    gEnter.append("rect")
      .style("fill", '#7F9FC5')
      .attr("x", (d,i) => @barScale(i))
      .attr("y", (d) => @height )
      .attr("width", @barScale.rangeBand())
      .attr("height", 0)


  updateGraph:(->
    data = @bins.entries(@data.toArray())

    @setupScale(data)
    @g.selectAll("rect")
      .data(data)
      .transition()
      .style("fill", '#7F9FC5')
      .attr("x", (d,i) => @barScale(i))
      .attr("y", (d) => @height - @heightScale(d.values))
      .attr("width", @barScale.rangeBand())
      .attr("height", (d) => @heightScale(d.values))
    ).observes('data')
})

`export default HistogramChartComponent`
