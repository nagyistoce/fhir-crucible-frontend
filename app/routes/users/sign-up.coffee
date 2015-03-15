`import Ember from 'ember'`
`import HeaderFooterDisablerMixin from '../../mixins/header-footer-disabler'`

SignUpRoute = Ember.Route.extend(HeaderFooterDisablerMixin, {
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
