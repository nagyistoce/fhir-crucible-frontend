`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

ApplicationRoute = Ember.Route.extend(ApplicationRouteMixin, {
  actions: {
    openModal: (modalName, model) ->
      @controllerFor(modalName).set('model', model)
      @render(modalName, {
        into: 'application'
        outlet: 'modal'
      })

    closeModal: ->
      @disconnectOutlet({
        outlet: 'modal'
        parentView: 'application'
      })
  }
})

`export default ApplicationRoute`
