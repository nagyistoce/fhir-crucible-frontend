`import Ember from 'ember'`
`import DeviseAuthenticator from 'simple-auth-devise/authenticators/devise'`

CrucibleAuthenticator = DeviseAuthenticator.extend({
  invalidate: ->
    Ember.$.ajax({
      data: {
        _method: 'DELETE'
      }
      type: 'POST'
      url: '/api/users/sign_out'
    })
})

`export default CrucibleAuthenticator`
