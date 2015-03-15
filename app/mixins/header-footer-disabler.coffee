`import Ember from 'ember'`

HeaderFooterDisablerMixin = Ember.Mixin.create({
  activate: ->
    @controllerFor('application').setProperties({
      enableHeader: false
      enableFooter: false
    })
    return

  deactivate: ->
    @controllerFor('application').setProperties({
      enableHeader: true
      enableFooter: true
    })
    return
})

`export default HeaderFooterDisablerMixin`
