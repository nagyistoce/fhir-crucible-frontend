`import Ember from 'ember'`

SignUpRoute = Ember.Route.extend({
  resetController: (controller, isExiting) ->
    if isExiting
      controller.setProperties({
        identification: null
        password: null
        registered: false
        loginFailed: false
      })
    return
})

`export default SignUpRoute`
