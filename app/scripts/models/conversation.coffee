Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  minsAccount: DS.belongsTo('Intimi.MinsAccount')

  messages: DS.hasMany('Intimi.Message')
  surveys:  DS.hasMany('Intimi.Survey')

  latestMessage: (-> @get('messages.firstObject')).property('messages.@each')

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.isEmpty(survey.get('attitude'))
  ).property('surveys.@each.attitude')

  appendMessage: (content, needToReply) ->
    message = @get('messages').createRecord content: content, createAt: Date.new

    if needToReply
      @get('surveys').createRecord createdAt: Date.new, updatedAt: Date.new, message: message

Intimi.Conversation.reopenClass
  findByInterlocutor: (interlocutor) ->
    new Ember.RSVP.Promise (resolve, reject) ->
      @get('store').find(Intimi.Conversation, interlocutor: interlocutor).then (conversations) ->
        resolve conversations.get('firstObject')
