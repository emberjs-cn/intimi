Intimi.ConversationsRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.mobileAccount.available')
      Ember.RSVP.reject('MobileAccount not available')

  model: -> Intimi.Conversation.find()

  events:
    error: ->
      @controllerFor('index').set('mobileAccountAlertLevelUp', true)
      @transitionTo('/')
