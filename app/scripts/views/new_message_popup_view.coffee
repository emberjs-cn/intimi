Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNames: ['new-message-popup']

  didInsertElement: ->
    @$('.popup-receivers input').focus()

  submit: ->
    @get('controller').send('createMessage', @get('receivers'), @get('content'), @get('survey'))

    @setProperties
      receivers: ''
      content: ''
      survey: false
      'controller.newMessagePopupVisible': false
