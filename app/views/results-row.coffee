`import Ember from 'ember'`

ResultsRowView = Ember.View.extend({
  tagName: 'tr'
  attributeBindings: ['href', 'data-toggle']
  href: "#result-row"
  'data-toggle': 'pill'

  setHref: (-> @set('href', "#{@get('data-target')}")).on('init')

  click: (e) ->
    @$(e.target).closest('tbody').children('tr').removeClass('active')
    @$(e.target).closest('tr').addClass('active')
})

`export default ResultsRowView`
