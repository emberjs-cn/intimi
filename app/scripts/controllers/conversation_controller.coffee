Intimi.ConversationController = Ember.ObjectController.extend
  currentSurveyIndex: 0

  currentSurvey: (->
    @get('notRepliedSurveys').objectAt(@get('currentSurveyIndex'))
  ).property('notRepliedSurveys.@each.attitude', 'currentSurveyIndex')

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

  sendMessage: (content, needAReply) ->
    return if Ember.isEmpty(content)

    message = @get('model.messages').createRecord content: content, needAReply: needAReply
    message.save()
