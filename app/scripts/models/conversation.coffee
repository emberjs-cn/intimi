Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  minsAccount: DS.belongsTo('minsAccount')

  messages: DS.hasMany('message', async: true)
  surveys:  DS.hasMany('survey', async: true)

  latestMessage: (-> @get('messages.lastObject')).property('messages.@each')

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.isEmpty(survey.get('attitude'))
  ).property('surveys.@each.attitude')

  appendMessage: (content, needToReply) ->
    self = @

    message = @get('store').createRecord 'message', content: content, createdAt: new Date(), conversation: @
    message.save().then ->
      self.get('messages').pushObject(message)
      if needToReply
        survey = self.get('store').createRecord 'survey', createdAt: new Date(), updatedAt: new Date(), message: message, conversation: self
        survey.save().then ->
          self.get('surveys').pushObject(survey)
          self.save()
      else
        self.save()
