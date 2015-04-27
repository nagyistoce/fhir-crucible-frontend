`import Ember from 'ember'`

StarburstChartComponent = Ember.Component.extend
  # data: []
  # server: null
  # width: 960
  # height: 700

  # didInsertElement: ->
  #   @_renderChart()
  #   return

  # _renderChart: (->
  #   # set width and height
  #   width = parseInt(@get('width'), 10)
  #   height = parseInt(@get('height'), 10)

  #   # remove old elements
  #   element = d3.select(@element)
  #   element.selectAll('svg').remove()

  #   # set up svg element
  #   svg = d3.select(@element)
  #     .append('svg')
  #     .attr('width', width)
  #     .attr('height', height)
  #     .append('g')
  #     .attr('transform', 'translate(' + width / 2 + ',' + (height / 2 + 10) + ')')

  #   # initialize variables
  #   radius = Math.min(width, height) / 3
  #   x = d3.scale.linear().range([0, 2 * Math.PI])
  #   y = d3.scale.sqrt().range([0, radius])
  #   color = d3.scale.category20c()

  #   # create partition
  #   partition = d3.layout.partition()
  #       .sort(null)
  #       .value(-> (d) { return 1 })

  #   # create arc
  #   arc = d3.svg.arc()
  #       .startAngle(-> (d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))) })
  #       .endAngle(-> (d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))) })
  #       .innerRadius(-> (d) { return Math.max(0, y(d.y)) })
  #       .outerRadius(-> (d) { return Math.max(0, y(d.y + d.dy)) });

  #   # keep track of the node that is currently being displayed as the root
  #   node = null
  #   d3.json("fhir.json", -> (error, root) {
  #     node = root
  #     path = svg.datum(root).selectAll("path")
  #         .data(partition.nodes)
  #         .enter().append("path")
  #         .attr("d", arc)
  #         .style("fill", -> (d) { return color((d.children ? d : d.parent).name) })
  #         .on("click", click)
  #         .each(stash)
  #     d3.selectAll("input").on("change", -> change() {
  #       value = this.value === "count"
  #           ? -> () { return 1 }
  #           : -> (d) { return d.size }
  #       path
  #         .data(partition.value(value).nodes)
  #         .transition()
  #         .duration(1000)
  #         .attrTween("d", arcTweenData)
  #     })
  #     -> click(d) {
  #       node = d
  #       path.transition()
  #         .duration(1000)
  #         .attrTween("d", arcTweenZoom(d))
  #     }
  #   })

  #   d3.select(self.frameElement).style("height", height + "px")

  #   # setup for switching data: stash the old values for transition
  #   -> stash(d) {
  #     d.x0 = d.x
  #     d.dx0 = d.dx
  #   }

  #   # when switching data: interpolate the arcs in data space
  #   -> arcTweenData(a, i) {
  #     oi = d3.interpolate({x: a.x0, dx: a.dx0}, a)
  #     -> tween(t) {
  #       b = oi(t)
  #       a.x0 = b.x
  #       a.dx0 = b.dx
  #       return arc(b)
  #     }
  #     if (i == 0) {
  #      # if we are on the first arc, adjust the x domain to match the root node
  #      # at the current zoom level (we only need to do this once)
  #       xd = d3.interpolate(x.domain(), [node.x, node.x + node.dx])
  #       return ->(t) {
  #         x.domain(xd(t))
  #         return tween(t)
  #       }
  #     } else {
  #       return tween
  #     }
  #   }

  #   # when zooming: interpolate the scales
  #   -> arcTweenZoom(d) {
  #     xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx])
  #     yd = d3.interpolate(y.domain(), [d.y, 1])
  #     yr = d3.interpolate(y.range(), [d.y ? 20 : 0, radius])
  #     return -> (d, i) {
  #       return i
  #         ? -> (t) { return arc(d); }
  #         : -> (t) { x.domain(xd(t)); y.domain(yd(t)).range(yr(t)); return arc(d) }

`export default StarburstChartComponent`
