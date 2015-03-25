`import Ember from 'ember'`

Case = window.Case

titleCase = (value) ->
 Case.title(value)

`export { titleCase }`
`export default Ember.Handlebars.makeBoundHelper(titleCase)`
