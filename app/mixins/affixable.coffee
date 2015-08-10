`import Ember from 'ember'`

AffixableMixin = Ember.Mixin.create({
  stickyTopSpacing: 0

  _setup: Ember.on('didInsertElement', ->
    @$().sticky({ topSpacing: @get('stickyTopSpacing') })
    return
  )

  _teardown: Ember.on('willDestroyElement', ->
    return if @isDestroyed

    @$().unstick()
  )
})

`export default AffixableMixin`
