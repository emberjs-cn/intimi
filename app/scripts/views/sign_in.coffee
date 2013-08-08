Intimi.AuthSignInView = Ember.View.extend
  templateName: 'auth/sign_in'

  login:    null
  password: null
  remember: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()

    if @get('login') == 'intimi' && @get('password') == '123456'
      Intimi.Auth.createSession '{ "user_id": 1, "auth_token": "123456" }'
