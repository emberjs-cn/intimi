Intimi.AuthSignOutView = Ember.View.extend
  templateName: 'auth/sign-out'

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    Intimi.Auth.signOut()
