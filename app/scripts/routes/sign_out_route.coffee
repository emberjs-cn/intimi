Intimi.SignOutRoute = Ember.Route.extend
  beforeModel: ->
    Intimi.Auth.set('user', null)
    @transitionTo('/')
