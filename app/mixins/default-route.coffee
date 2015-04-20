`import Ember from 'ember'`

DefaultRouteMixin = Ember.Mixin.create({
  actions:
    loading: ->
      loading = Ember.$('#loading-modal').modal(
        backdrop: 'static',
        keyboard: false
      )
      @router.one('didTransition', ->
        loading.modal('hide')
        return
      )
      return
})

`export default DefaultRouteMixin`
