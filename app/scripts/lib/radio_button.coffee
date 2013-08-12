Intimi.RadioButton = Ember.View.extend
  attributeBindings: ["isDisabled:disabled", "type", "name", "value"]
  classNames: ["ember-radio-button"]

  value: null

  selectedValue: null

  isDisabled: false

  isChecked: false

  tagName: "input"
  type: "radio"

  didInsertElement: ->
    Ember.addObserver(@, 'isChecked', @, @isCheckedDidChange)
    @isCheckedDidChange()

  willInsertElement: ->
    Ember.removeObserver(@, 'isChecked', @, @isCheckedDidChange)

  selectedValueDidChange: Ember.observer(->
    @set('isChecked', @get('value') == @get('selectedValue'))
  , 'selectedValue')

  isCheckedDidChange: ->
    isChecked = @get('isChecked')

    @$().prop('checked', isChecked ? 'checked' : null)

    if (isChecked)
      @set('selectedValue', @get('value'))

  init: ->
    @_super()
    @selectedValueDidChange()

  click: ->
    Ember.run.once(@, @_updateElementValue)

  _updateElementValue: ->
    @set('isChecked', @$().prop('checked'))
