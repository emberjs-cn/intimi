Intimi.ConversationRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.capitalAccount.available')
      Ember.RSVP.reject('Capital account not available')

    Intimi.ConversationPollster.stop()

  setupController: (controller, model) ->
    Intimi.ConversationPollster.start(model)

    @_super(controller, model)
