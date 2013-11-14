Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  actions:
    appendTitle: (title) ->
      origin = $('.new-message-popup textarea').val()
      $('.new-message-popup textarea').val(origin + '%{%@}'.fmt(title))

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

    sendMessageInBatchMode: (content, filePath, needToReply = false) ->
      $.post(Intimi.HOST + '/v1/sms_messages/batch_create', content: content, need_to_reply: needToReply, file_path: filePath).then =>
        @get('store').find('conversation')
        @transitionToRoute('conversations')
