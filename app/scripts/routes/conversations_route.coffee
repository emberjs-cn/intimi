Intimi.ConversationsRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.capitalAccount.available')
      Ember.RSVP.reject('Capital account not available')

  model: ->
    @get('store').find('conversation')

  actions:
    loadMore: -> @get('controller').loadNextPage()

    error: ->
      @controllerFor('home').set('minsAccountAlertLevelUp', true)
      @transitionTo('/home')
