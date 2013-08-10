Intimi.SignOutRoute = Ember.Route.extend
  beforeModel: ->
    Intimi.Auth.destroySession()
    @transitionTo('/')
