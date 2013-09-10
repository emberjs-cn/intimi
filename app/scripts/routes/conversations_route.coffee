Intimi.ConversationsRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.minsAccount.available')
      Ember.RSVP.reject('MinsAccount not available')

  model: ->
    @get('store').findAll('conversation')

  actions:
    error: ->
      @controllerFor('index').set('minsAccountAlertLevelUp', true)
      @transitionTo('/')
