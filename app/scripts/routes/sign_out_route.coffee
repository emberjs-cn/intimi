Intimi.SignOutRoute = Ember.Route.extend
  init: ->
    Intimi.Auth.destroySession()
    @transitionTo('/')
