`import CrucibleAuthorizer from '../authorizers/crucible'`
`import CrucibleAuthenticator from '../authenticators/crucible'`

# Takes two parameters: container and app
initialize = (container) ->
  container.register('authorizer:crucible', CrucibleAuthorizer)
  container.register('authenticator:crucible', CrucibleAuthenticator)
  return

CrucibleSimpleAuthInitializer =
  name: 'crucible-simple-auth'
  before: 'simple-auth'
  initialize: initialize

`export {initialize}`
`export default CrucibleSimpleAuthInitializer`
