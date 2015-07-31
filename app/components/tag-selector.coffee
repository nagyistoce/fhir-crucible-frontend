`import Ember from 'ember'`

TagSelectorComponent = Ember.Component.extend({
  classNames: ['pull-right']

  showModal: false

  tags: null
  selectedTags: null

  sortedTags: Ember.computed('tags.[]', ->
    @get('tags').sort((a, b) ->
      a = a.toLowerCase()
      b = b.toLowerCase()

      return -1 if (a < b)
      return 1 if (a > b)
      0
    )
  )

  proxiedTags: Ember.computed('sortedTags.[]', 'selectedTags.[]', ->
    selectedTags = @get('selectedTags') || []
    @get('sortedTags').map((tag) ->
      {
        tagName: tag,
        selected: selectedTags.contains(tag)
      }
    )
  )

  actions: {
    openModal: ->
      @toggleProperty('showModal')
      return

    hideModal: ->
      @set('showModal', false)

    toggleTag: (tag) ->
      @sendAction('toggleTag', tag)
      return
  }
})

`export default TagSelectorComponent`
