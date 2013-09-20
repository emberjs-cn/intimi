Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  messages: DS.hasMany('message')
  surveys:  DS.hasMany('survey')

  latestMessage: (-> @get('messages.lastObject')).property('messages.@each')

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.isEmpty(survey.get('attitude'))
  ).property('surveys.@each.attitude')

  appendMessage: (content, needToReply) ->
    self = @

    message = @get('messages').createRecord content: content, needToReply: needToReply
    message.save().then ->
      self.get('messages').pushObject(message)
      self.get('surveys').pushObject(message.get('survey'))
