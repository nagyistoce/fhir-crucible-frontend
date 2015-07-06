`import Ember from 'ember'`
`import trueNullProperty from '../utils/true-null-property'`

ServerDetailsComponent = Ember.Component.extend(
  server: null

  name: null
  editingServerName: false
  savingServerName: false

  submitBtnDisabled: trueNullProperty('savingServerName')

  actions:
    editServerName: ->
      @setProperties(name: @get('server.name'), editingServerName: true)
      return

    submit: ->
      @set('savingServerName', true)

      successFn = =>
        @setProperties(editingServerName: false, savingServerName: false)

      errorFn = =>
        alert('There was a problem saving the server name, please try again.')
        @setProperties(editingServerName: false, savingServerName: false)
        return

      server = @get('server')
      server.set('name', @get('name'))
      server.save().then(successFn, errorFn)
      return
)

`export default ServerDetailsComponent`
