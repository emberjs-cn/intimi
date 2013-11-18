Intimi.ConversationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    Intimi.ConversationPollster.start(model)

    @_super(controller, model)

  actions:
    willTransition: ->
      Intimi.ConversationPollster.stop()

