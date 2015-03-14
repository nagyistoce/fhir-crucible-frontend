`import Ember from 'ember'`
`import DeviseAuthorizer from 'simple-auth-devise/authorizers/devise'`

CrucibleAuthorizer = DeviseAuthorizer.extend({
  authorize: (jqXHR, requestOptions) ->
    userToken          = @get('session').get(@tokenAttributeName)
    userIdentification = @get('session').get(@identificationAttributeName)
    if @get('session.isAuthenticated') && !Ember.isEmpty(userToken) && !Ember.isEmpty(userIdentification)
      jqXHR.setRequestHeader('X-User-Email', userIdentification)
      jqXHR.setRequestHeader('X-User-Token', userToken)
    return
})

`export default CrucibleAuthorizer`
