Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNames: ['new-message-popup']

  didInsertElement: ->
    @$('.popup-receivers input').focus()

  submit: (event) ->
    @get('controller').send('createMessage', @get('numbers'), @get('content'), @get('survey'))

    @setProperties
      numbers: ''
      content: ''
      survey: false
      'controller.newMessagePopupVisible': false

      event.preventDefault()
      event.stopPropagation()
