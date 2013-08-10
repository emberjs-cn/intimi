Intimi.AuthSignInView = Ember.View.extend
  templateName: 'auth/sign_in'

  login:    null
  password: null
  remember: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()

    Intimi.User.find(name: @get('login'), password: @get('password')).then (users) ->
      user = users.get('firstObject')
      Intimi.Auth.createSession '{ "user_id": "' + user.get('id') + '", "auth_token": "uvwxyz" }' if user
