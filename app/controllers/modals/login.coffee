`import Ember from 'ember'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`

ModalsLoginController = Ember.Controller.extend(LoginControllerMixin, {
  authenticator: 'authenticator:crucible'

  identification: null
  password: null
  loginFailed: false

  reset: ->
    @setProperties({
      identification: null,
      password: null,
      loginFailed: false
    })

  actions: {
    authenticate: ->
      # quickly exit and avoid the AJAX call if either the email or password is empty
      if Ember.isEmpty(@get('identification')) || Ember.isEmpty(@get('password'))
        @set('loginFailed', true)
        return

      errorFn = (response) =>
        # log in failed, either invalid email or password
        @set('loginFailed', true)
        return

      successFn = =>
        @send('closeModal')
        @reset()
        return

      # wipe the failed message and make the AJAX call to log the user in
      # this._super() is defined by ember-simple-auth in
      # the LoginControllerMixin included in this controller
      @set('loginFailed', false)
      @_super().then(successFn, errorFn)

    register: ->
      @transitionToRoute('users.sign-up')
      @reset()
      return

    close: ->
      @send('closeModal')
      @reset()
      return
  }
})

`export default ModalsLoginController`
