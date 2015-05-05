`import Ember from 'ember'`

percentProperty = (dependentKey) ->
  Ember.computed(dependentKey, 'total', ->
    if @get('total') == 0
      0
    else
      Math.floor(@get(dependentKey) / @get('total') * 100)
  )

CategoryBarGraph = Ember.Component.extend(
  classNames: ['progress-small']

  category: null

  total: Ember.computed.oneWay('category.total')
  passed: Ember.computed.oneWay('category.passed')
  failed: Ember.computed.oneWay('category.failed')
  untested: (->
    @get('total') - (@get('passed') + @get('failed'))
  ).property('total', 'passed', 'failed')

  passedPercent: percentProperty('passed')
  failedPercent: percentProperty('failed')
  untestedPercent: percentProperty('untested')

  _sizeProgressbars: (->
    @$('.progress-bar-success').css('width', "#{@get('passedPercent')}%")
    @$('.progress-bar-danger').css('width', "#{@get('failedPercent')}%")

    untestedPercent = if @get('total') == 0 then 100 else @get('untestedPercent')
    @$('.progress-bar-untested').css('width', "#{untestedPercent}%")
  ).observes('passedPercent', 'failedPercent', 'untestedPercent').on('didInsertElement')

  _createTooltips: (->
    @$('.progress-bar-success').tooltip({
      container: 'body',
      title: "#{@get('passed')} / #{@get('total')} (#{@get('passedPercent')}%)"
    })
    @$('.progress-bar-danger').tooltip({
      container: 'body',
      title: "#{@get('failed')} / #{@get('total')} (#{@get('failedPercent')}%)"
    })
    @$('.progress-bar-untested').tooltip({
      container: 'body',
      title: "#{@get('untested')} / #{@get('total')} (#{@get('untestedPercent')}%)"
    })
  ).observes('passed', 'failed', 'untested', 'total').on('didInsertElement')

  _destroyTooltips: (->
    return if @get('isDestroyed')
    @$('.progress-bar-success').tooltip('destroy')
    @$('.progress-bar-danger').tooltip('destroy')
    @$('.progress-bar-untested').tooltip('destroy')
  ).on('willDestroyElement')
)

`export default CategoryBarGraph`
