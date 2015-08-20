flattenArray = (arrayOfArrays) ->
  temp = []
  for element in arrayOfArrays
    for subElem in element
      temp.pushObject(subElem)

`export default flattenArray`
