Intimi.Conversation = DS.Model.extend
  interlocutor:  DS.attr('string')

  messages: DS.hasMany('message')
  surveys:  DS.hasMany('survey')

  contact: DS.belongsTo('contact')

  #contact: (->
    #@get('store').findQuery('contact', 'q[telephones_value_eq]': @get('interlocutor'), 'q[telephones_faxable_eq]': false).then (array) ->
      #array[0]
  #).property('interlocutor')

  latestMessage: (-> @get('messages.firstObject')).property('messages.@each').volatile()

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.isEmpty(survey.get('attitude'))
  ).property('surveys.@each.attitude')

  appendMessage: (content, needToReply) ->
    message = @get('messages').createRecord content: content, needToReply: needToReply
    message.save().then =>
      @get('store').find('conversation')
