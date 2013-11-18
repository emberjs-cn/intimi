Intimi.ApplicationController = Ember.ArrayController.extend
  # when a user enters the app unauthenticated, the transition
  # to where they are going is saved off so it can be retried
  # when they have logged in.
  savedTransition: null

  login: () ->
    data = JSON.parse localStorage.getItem('intimi:currentUser')
    serializer = @get('store').serializerFor('user')
    data = serializer.extract(@get('store'), Intimi.User, user: data, data.id, 'find')
    user = @get('store').push('user', data)
    Intimi.Auth.set 'user', user

    @set 'savedTransition', null

  logout: ->
    localStorage.setItem('intimi:currentUser', null)
    Intimi.Auth.set('user', null)

