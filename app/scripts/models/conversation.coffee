Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  minsAccount: DS.belongsTo('minsAccount')

  messages: DS.hasMany('message')
  surveys:  DS.hasMany('survey')

  latestMessage: (-> @get('messages.firstObject')).property('messages.@each')

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.isEmpty(survey.get('attitude'))
  ).property('surveys.@each.attitude')

  appendMessage: (content, needToReply) ->
    message = @get('messages').createRecord content: content, createAt: new Date()
    message.save().then =>
      if needToReply
        survey = @get('surveys').createRecord createdAt: new Date(), updatedAt: new Date(), message: message
        survey.save()
