`import Ember from 'ember'`

TestTimeline = Ember.Component.extend
  testRuns: Em.A()
  width: 600
  height: 1
  boxSize: 11
  yScale: d3.scale.ordinal()
  xScale: d3.scale.ordinal()
  boxPadding: 1
  margin: 1


  updateGraph:(->
    tip = d3.tip()
      .attr('class', 'd3-tip')
      .direction('e')
      .offset([0,10])
      .html((d) -> "test: #{d.test.get('name')}<br/> server #{d.server.get('url')} <br/> #{d.test.get('methods').join("<br/>")}")
    testRunData = []
    @testRuns.forEach (testRun) =>
      testRun.get('testResults').forEach (result) =>
        testRunData.push({server_id: testRun._data.server, test_id: result._data.test, date: moment(testRun._data.date), server: testRun.get('server'), test: result.get('test')})
    @height = 7 * (@boxSize+2*@boxPadding)+@margin
    @yScale.domain(d3.range(0,7))
      .range(d3.range(@margin, @height, @boxSize+2*@boxPadding))
    @xScale.domain(d3.range(0,52))
      .range(d3.range(@margin, @width, @boxSize+2*@boxPadding))
    debugger


    svg = d3.select("##{@elementId}").select("svg")

    svg.selectAll(".testRun").data(testRunData)
      .enter()
      .append('rect')
      .attr('height',@boxSize)
      .attr('width', @boxSize)
      .attr('x', (d) => @xScale(d.test_id))
      .attr('y', (d) => @yScale(d.server_id))
      .attr('rx', @boxSize/4)
      .attr('ry', @boxSize/4)
      .classed('testRun', true)
      .on('mouseover', tip.show)
      .on('mouseout', tip.hide)
      .call(tip)
    # svg.attr('viewBox', "0 0 #{svg.node().getBBox().width} #{svg.node().getBBox().height}")

  ).observes('servers', 'tests', 'testRuns').on('didInsertElement')

`export default TestTimeline`
