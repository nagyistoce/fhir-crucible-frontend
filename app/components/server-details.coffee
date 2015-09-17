`import Ember from 'ember'`
`import trueNullProperty from '../utils/true-null-property'`


ServerDetailsComponent = Ember.Component.extend(
  server: null
  position: 'center'
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

      if this.session.isAuthenticated
        server = @get('server')
        server.set('name', @get('name'))
        server.save().then(successFn, errorFn)
        return
      else
        alert('Must log in to change server name')
        @setProperties(editingServerName: false, savingServerName: false)
        return
)

`export default ServerDetailsComponent`
