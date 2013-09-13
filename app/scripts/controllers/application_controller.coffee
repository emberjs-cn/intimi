Intimi.ApplicationController = Ember.ArrayController.extend
  # when a user enters the app unauthenticated, the transition
  # to where they are going is saved off so it can be retried
  # when they have logged in.
  savedTransition: null

  login: ->
    @set 'savedTransition', null

  logout: ->
    localStorage.setItem('intimi:currentUser', null)
    Intimi.Auth.set('user', null)

