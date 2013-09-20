Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  actions:
    sendMessage: (interlocutorsString, content, needToReply = false) ->
      interlocutors = interlocutorsString.split(',')

      store = @get('store')
      interlocutors.forEach (interlocutor) ->
        store.find('conversation', q: { interlocutor_eq: interlocutor }).then (conversations) ->
          conversation = conversations.get('firstObject')
          return conversation.appendMessage(content, needToReply) if conversation

          conversation = store.createRecord 'conversation', interlocutor: interlocutor
          conversation.save().then -> conversation.appendMessage(content, needToReply)
