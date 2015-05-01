`import Ember from 'ember'`
`import starburstFixtureData from '../utils/starburst-fixture-data'`

# returns true if all child tests pass and false if not
allSuccessful = (data) ->
  successful = true
  for child in data
    if child.children
      successful &&= allSuccessful(child.children)
    else
      successful &&= child.failed == 0
  successful

# returns appropriate color of section (recursive)
color = (data) ->
  success = false
  if data.children
    success = allSuccessful(data.children)
  else
    success = data.failed == 0

  if data.failed == 0 && data.passed == 0
    '#bbb'
  else if data.passed > data.failed
    '#437412'
  else
    '#770011'

# returns appropriate opacity of a failed section
opacity = (data) ->
  if data.failed == 0
    opacity = 1
  else
    opacity = data.failed / data.total


# returns appropriate tool tip for section
tip = d3.tip()
  .attr('class', 'd3-tip')
  .offset([-10, 0])
  .html((d) ->
    if d.children || (d.failed == 0 && d.passed == 0)
      d.name
    else
      "#{d.name}:<br>#{d.passed} / #{d.total} passed")


StarburstChartComponent = Ember.Component.extend(
  data: starburstFixtureData
  size: 600
  padding: 5

  _renderChart: (->

    # initialize width, height, radius, x, and y
    width = height = parseInt(@get('size'), 10) - 2 * @get('padding')
    radius = Math.min(width, height) / 3
    x = d3.scale.linear().range([0, 2 * Math.PI])
    y = d3.scale.sqrt().range([0, radius])
    # color = d3.scale.category20c()

    # intitialize svg element with given dimensions
    svg = d3.select(@get('element')).append("svg")
      .attr("width", width)
      .attr("height", height)
      .append("g")
      .attr("transform", "translate(#{width / 2},#{height / 2 + 10})") # center in svg

    # activate tool tip
    svg.call(tip)

    logScale = d3.scale.log()
    colorScale = d3.scale.linear()
                         .domain([1,0.2,0])
                         .range(['#437412','#D85D20','#770011'])
    partition = d3.layout.partition()
      .sort(null)
      .value((d) -> logScale(d.total + 10))

    arc = d3.svg.arc()
      .startAngle((d) -> Math.max(0, Math.min(2 * Math.PI, x(d.x))))
      .endAngle((d) -> Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))))
      .innerRadius((d) -> Math.max(0, y(d.y)))
      .outerRadius((d) -> Math.max(0, y(d.y + d.dy)))

    root = @get('data')
    node = root

    # Setup for switching data: stash the old values for transition.
    stash = (d) ->
      d.x0 = d.x
      d.dx0 = d.dx
      return

    # When switching data: interpolate the arcs in data space.
    arcTweenData = (a, i) ->
      oi = d3.interpolate({x: a.x0, dx: a.dx0}, a)
      tween = (t) ->
        b = oi(t)
        a.x0 = b.x
        a.dx0 = b.dx
        arc(b)

      if i == 0
       # If we are on the first arc, adjust the x domain to match the root node
       # at the current zoom level. (We only need to do this once.)
        xd = d3.interpolate(x.domain(), [node.x, node.x + node.dx])
        (t) ->
          x.domain(xd(t))
          tween(t)
      else
        tween

    # When zooming: interpolate the scales.
    arcTweenZoom = (d) ->
      xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx])
      yd = d3.interpolate(y.domain(), [d.y, 1])
      yr = d3.interpolate(y.range(), [(if d.y then 20 else 0), radius])
      (d, i) ->
        if i
          (t) -> arc(d)
        else
          (t) ->
            x.domain(xd(t))
            y.domain(yd(t)).range(yr(t))
            arc(d)

    path = svg.datum(root).selectAll("path")
      .data(partition.nodes)
      .enter()
        .append("path")
        .attr("d", arc)
        .style("fill", (d) ->
          if d.total > 0
            colorScale(d.passed/d.total)
          else
            '#bbb'
        )
        .style("stroke", '#fff')
        # .style("opacity", opacity)
        .on("click", (d) ->
          if d.children
            node = d
            path.transition()
              .duration(1000)
              .attrTween("d", arcTweenZoom(d))
        )
        .on('mouseover', tip.show)
        .on('mouseout', tip.hide)
        .each(stash)
    return
  ).on('didInsertElement')
)

`export default StarburstChartComponent`
