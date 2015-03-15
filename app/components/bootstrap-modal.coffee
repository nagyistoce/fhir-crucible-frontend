`import Ember from 'ember'`

BootstrapModalComponent = Ember.Component.extend({
  classNames: ['modal']
  classNameBindings: ['fade']
  fade: false

  title: null
  okBtnTitle: 'Close'
  submitBtnTitle: null
  formClass: ''
  submitBtnClass: 'btn-primary'
  disableSubmitBtn: false

  displaySubmitBtn: Ember.computed.notEmpty('submitBtnTitle')
  displayCloseBtn: Ember.computed.notEmpty('okBtnTitle')

  willInsertElement: ->
    @$().modal().one('hidden.bs.modal', =>
      @sendAction('close')
      return
    )
    return

  actions: {
    close: ->
      @$().modal('hide')
      return

    submit: ->
      @sendAction('submit')
      return
  }
})

`export default BootstrapModalComponent`
