`import Ember from 'ember'`

BootstrapPopoverComponent = Ember.Component.extend({
  tagName: 'div'
  classNames: ['conformance-badge-popover']

  placement: 'top'

  didInsertElement: ->
    @_createPopover()

  _createPopover: ->
    @_destroyPopover() if @_popover?

    contents = @$('.popover-js')
    @_popover = @$().popover(
      trigger: 'hover'
      animation: false
      placement: @get('placement')
      html: true
      content: contents
    ).on('show.bs.popover', ->
      contents.removeClass('hide')
    )

  _destroyPopover: ->
    return if !@_popover? || @get('isDestroyed')

    @$().popover('destroy')
    @_popover = null

  willDestroyElement: ->
    return if @get('isDestroyed')

    @_destroyPopover()
})

`export default BootstrapPopoverComponent`
