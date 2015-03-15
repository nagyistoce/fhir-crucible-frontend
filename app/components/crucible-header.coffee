`import Ember from 'ember'`

HeaderComponent = Ember.Component.extend({
  session: null

  actions: {
    openLoginModal: ->
      @sendAction('openModal', 'modals.login')
      false

    invalidateSession: ->
      @sendAction('invalidateSession')
  }
})

`export default HeaderComponent`
