Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  createMessage: ->
    # FIXME Handle relations
    # receiver = Intimi.Receiver.find(number: @get('messageNumber'))
    message = Intimi.Message.createRecord({
      content: @get('newMessageContent')
      survey: @get('newMessageSurvey')
      #receiver: receiver
      #sender: currentUser
    })

    @setProperties(editingMessage: false, newMessageReceiver: '', newMessageContent: '', newMessageSurvey: false)
    message.save()

