Intimi.InterlocutorSelection = Ember.TextField.extend
  type: 'hidden'
  classNames: ['input-plain']

  didInsertElement: ->
    controller = @get('controller')

    @$().select2
      tags: []
      tokenSeparators: [',', ' ']
      multiple: true

  willDestroyElement: ->
    @$().select2('destroy')
