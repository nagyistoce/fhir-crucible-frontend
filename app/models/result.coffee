`import DS from 'ember-data'`
`import Tabbable from '../mixins/tabbable'`

Result = DS.Model.extend(Tabbable, {
  code: DS.attr()
  # data: DS.attr()
  description: DS.attr()
  key: DS.attr()
  message: DS.attr()
  status: DS.attr()
  testMethod: DS.attr()
  links: DS.attr()#hasMany('link')
  requires: DS.attr()#hasMany('resource')
  validates: DS.attr()#hasMany('resource')
  # warnings: DS.hasMany('warning')
  failed: (-> (@get('status') == 'fail' or @get('status') == 'error')).property('status')
  passed: (->!@get('failed')).property('failed')
})

`export default Result`
