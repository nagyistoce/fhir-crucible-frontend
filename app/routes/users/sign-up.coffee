`import Ember from 'ember'`

SignUpRoute = Ember.Route.extend({
  resetController: (controller, isExiting) ->
    if isExiting
      controller.setProperties({
        identification: null
        password: null
        passwordConfirmation: null
        errors: []
        formLoading: false
      })
    return
})

`export default SignUpRoute`
