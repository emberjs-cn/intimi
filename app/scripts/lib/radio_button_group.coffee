Intimi.RadioButtonGroup = Ember.View.extend
  classNames: ['ember-radio-button-group']
  attributeBindings: ['name:data-name']

  name: Ember.required()

  value: null

  RadioButton: Ember.computed ->
    Intimi.RadioButton.extend
      group: @
      selectedValueBinding: 'group.value'
      nameBinding: 'group.name'
