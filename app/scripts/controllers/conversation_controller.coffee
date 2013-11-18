Intimi.ConversationController = Ember.ObjectController.extend
  currentSurveyIndex: 0

  currentSurvey: (->
    @get('notRepliedSurveys').objectAt(@get('currentSurveyIndex'))
  ).property('notRepliedSurveys.@each.attitude', 'currentSurveyIndex')

  currentMessagesPage: 1

  sortedMessages: (->
    Ember.ArrayProxy.extend(Ember.SortableMixin).create
      content: @get('model.messages')
      sortProperties: ['createdAt']
      sortAscending: true
  ).property('model.messages')

  messagesTotalCount: (->
    @get('store').metadataFor('message').total
  ).property().volatile()

  hasMoreMessages: (->
    return false if @get('model.messages.length') < 25

    !@get('messagesTotalCount') || @get('messagesTotalCount') > @get('model.messages.length')
  ).property('model.messages.length', 'messagesTotalCount')

  actions:
    loadMoreMessages: ->
      self = @
      @get('store').find('message', conversation_id: @get('model.id'), page: @get('currentMessagesPage') + 1).then (messages) ->
        messages.forEach (message) -> self.get('model.messages').addObject(message)
        self.incrementProperty 'currentMessagesPage'

    nextSurvey: ->
      if @get('currentSurveyIndex') == @get('notRepliedSurveys.length') - 1
        @set('currentSurveyIndex', 0)
      else
        @incrementProperty('currentSurveyIndex')

    prevSurvey: ->
      if @get('currentSurveyIndex') == 0
        @set('currentSurveyIndex', @get('notRepliedSurveys.length') - 1)
      else
        @incrementProperty('currentSurveyIndex', -1)

    confirmSurvey: (survey) -> survey.confirm()
    rejectSurvey: (survey) -> survey.reject()
    remainNeutralSurvey: (survey) -> survey.remainNeutral()

    sendMessage: (content, needToReply) ->
      @get('model').appendMessage(content, needToReply) unless Ember.isEmpty(content)
