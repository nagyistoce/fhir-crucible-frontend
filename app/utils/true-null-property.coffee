trueNullProperty = (propertyName) ->
  Ember.computed(propertyName, ->
    return true if @get(propertyName)
    null
  )

`export default trueNullProperty`
