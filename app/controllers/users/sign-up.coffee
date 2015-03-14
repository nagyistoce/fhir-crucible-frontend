`import Ember from 'ember'`

SignUpController = Ember.Controller.extend({
  identification: null
  password: null
  passwordConfirmation: null
  errors: []

  formLoading: false

  hasErrors: Ember.computed.gt('errors.length', 0)

  _parseErrors: (errors) ->
    fullTextErrors = []
    console.debug(errors)
    keys = Ember.keys(errors)

    for field in keys
      prettyField = field.replace('_', ' ')
      prettyField = prettyField.substr(0, 1).toUpperCase() + prettyField.substr(1)

      fullTextErrors.push("#{prettyField} #{errorMsg}") for errorMsg in errors[field]

    fullTextErrors

  actions: {
    register: ->
      @set('formLoading', true)

      successFn = =>
        @set('formLoading', false)
        @transitionToRoute('users.login', { queryParams: { registered: true } })
        return
      errorFn = (jqXHR) =>
        response = Ember.$.parseJSON(jqXHR.responseText)
        @set('errors', @_parseErrors(response.errors || {}))
        @set('formLoading', false)
        return

      Ember.$.ajax({
        data: {
          user: {
            email: @get('identification'),
            password: @get('password'),
            password_confirmation: @get('passwordConfirmation')
          }
        }
        dataType: 'json'
        type: 'POST'
        url: '/api/users.json'
      }).then(successFn, errorFn)
      false
  }
})

`export default SignUpController`
