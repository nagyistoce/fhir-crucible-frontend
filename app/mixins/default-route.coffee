`import Ember from 'ember'`

DefaultRouteMixin = Ember.Mixin.create({
  actions:
    loading: ->
      return if @routeName in ['servers.results', 'multiservers.results']
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
