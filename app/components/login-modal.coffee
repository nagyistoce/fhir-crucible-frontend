`import BootstrapModal from './bootstrap-modal'`

LoginModal = BootstrapModal.extend({
  identification: null
  password: null
  loginFailed: false

  actions: {
    register: ->
      @send('close')
      @sendAction('register')
      return
  }
})

`export default LoginModal`
