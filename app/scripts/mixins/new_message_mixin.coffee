Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  actions:
    sendMessage: (interlocutorsString, content, needToReply = false) ->
      interlocutors = interlocutorsString.split(',')

      self = @
      interlocutors.forEach (interlocutor) ->
        self.get('store').find('conversation', q: { interlocutor_eq: interlocutor }).then (conversations) ->
          conversation = conversations.get('firstObject')
          return conversation.appendMessage(content, needToReply) if conversation

          conversation = self.get('store').createRecord 'conversation', interlocutor: interlocutor
          conversation.save().then ->
            conversation.appendMessage(content, needToReply)
            self.transitionToRoute('conversation', conversation)
