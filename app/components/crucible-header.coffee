`import Ember from 'ember'`

HeaderComponent = Ember.Component.extend({
  session: null

  actions: {
    invalidateSession: ->
      @sendAction('invalidateSession')
  }
})

`export default HeaderComponent`
