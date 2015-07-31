`import Ember from 'ember'`

TagFilterListComponent = Ember.Component.extend({
  classNames: ['tag-list']

  tags: null

  actions: {
    removeTagFromFilter: (tag) ->
      @sendAction('removeTagFromFilter', tag)
      return
  }
})

`export default TagFilterListComponent`
