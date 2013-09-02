Intimi.ConversationsRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.minsAccount.available')
      Ember.RSVP.reject('MinsAccount not available')

  #model: -> Intimi.Conversation.find()

  events:
    error: ->
      @controllerFor('index').set('minsAccountAlertLevelUp', true)
      @transitionTo('/')
