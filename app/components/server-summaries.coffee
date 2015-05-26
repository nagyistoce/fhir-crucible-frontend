`import Ember from 'ember'`

ServerSummariesComponent = Ember.Component.extend({
  classNames: ['carousel', 'slide']

  summaries: null
  _carousel: null

  elementIdTarget: (->
    "##{@get('elementId')}"
  ).property('elementId')

  sortedSummaries: (->
    @get('summaries').sortBy("percentPassed").reverse()
  ).property('summaries.@each.percentPassed')

  _setupCarouselObserver: (->
    Ember.run.debounce(@, @_setupCarousel, 500)
  ).observes('summarySegments.[]').on('didInsertElement')

  _setupCarousel: ->
    return if @get('summarySegments.length') == 0

    @_teardownCarousel()
    @$('.carousel-indicators li').removeClass('active').eq(0).addClass('active')
    @$('.item').removeClass('active').eq(0).addClass('active')
    @_carousel = @$().carousel({
      interval: false,
      keyboard: false
    })

  _teardownCarousel: Ember.on('willDestroyElement', ->
    return if @isDestroyed || Ember.isEmpty(@_carousel)
    @_carousel.carousel('destroy')
    @_carousel = null
  )

  summarySegments: (->
    summaries = @get('sortedSummaries')
    return [] if summaries.length == 0

    output = []
    for index in [0...summaries.length]
      col = Math.floor(index / 6)
      output[col] = { index: col, summaries: [] } if Ember.isNone(output[col])
      output[col].summaries.push(summaries.objectAt(index))

    output
  ).property('sortedSummaries.[]')
})

`export default ServerSummariesComponent`
