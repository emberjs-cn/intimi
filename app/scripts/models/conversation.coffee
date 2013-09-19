Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  messages: DS.hasMany('message', async: true)
  surveys:  DS.hasMany('survey', async: true)

  latestMessage: (-> @get('messages.lastObject')).property('messages.@each')

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.isEmpty(survey.get('attitude'))
  ).property('surveys.@each.attitude')

  appendMessage: (content, needToReply) ->
    self = @

    message = @get('store').createRecord 'message', content: content, needToReply: needToReply, conversation: @
    message.save().then ->
      self.get('messages').pushObject(message)
      self.get('surveys').pushObject(message.get('survey'))
