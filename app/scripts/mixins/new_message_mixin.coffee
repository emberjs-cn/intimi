Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  sendMessage: (interlocutorsString, content, needToReply = false) ->
    interlocutors = interlocutorsString.split(',')

    interlocutors.forEach (interlocutor) ->
      Intimi.Conversation.findByInterlocutor(interlocutor).then (conversation) ->
        unless conversation
          conversation = Intimi.Conversation.createRecord
            interlocutor: interlocutor
            account: Intimi.Auth.get('user.account')

        conversation.appendMessage(content, needToReply)
