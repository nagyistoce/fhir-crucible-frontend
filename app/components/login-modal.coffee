`import BootstrapModal from './bootstrap-modal'`

LoginModal = BootstrapModal.extend({
  identification: null
  password: null
  loggingIn: false
  loginFailed: false
  shouldCloseModal: false

  submitBtnDisabled: (->
    return true if @get('loggingIn')
    null
  ).property('loggingIn')

  _closeObserver: (->
    @send('close') if @get('shouldCloseModal')
    return
  ).observes('shouldCloseModal').on('init')

  actions: {
    register: ->
      @send('close')
      @sendAction('register')
      return
  }
})

`export default LoginModal`
