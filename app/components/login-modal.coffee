`import BootstrapModal from './bootstrap-modal'`
`import trueNullProperty from '../utils/true-null-property'`

LoginModal = BootstrapModal.extend({
  identification: null
  password: null
  loggingIn: false
  loginFailed: false
  shouldCloseModal: false

  submitBtnDisabled: trueNullProperty('loggingIn')

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
