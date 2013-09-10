Intimi.ProfileRoute = Ember.Route.extend
  model: ->
    Intimi.Auth.get('user')
