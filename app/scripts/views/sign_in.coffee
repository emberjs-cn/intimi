Intimi.AuthSignInView = Ember.View.extend
  templateName: 'auth/sign_in'

  login:    null
  password: null
  remember: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()

    user = Intimi.User.find(name: @get('login'), password: @get('password'))
    Intimi.Auth.createSession '{ "user_id": "' + user.get('id') + '", "auth_token": "uvwxyz" }' if user
