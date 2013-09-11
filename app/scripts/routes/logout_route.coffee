Intimi.LogoutRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('application').logout()
    @transitionTo('login')
