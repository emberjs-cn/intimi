Intimi.ConversationsRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.capitalAccount.available')
      Ember.RSVP.reject('Capital account not available')

  model: ->
    @get('store').findAll('conversation')

  actions:
    error: ->
      @controllerFor('home').set('minsAccountAlertLevelUp', true)
      @transitionTo('/home')
