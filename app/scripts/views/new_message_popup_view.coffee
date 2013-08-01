Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNames: ['new-message-popup']

  didInsertElement: ->
    @$('.popup-receiver input').focus()
