Intimi.AuthSignInView = Ember.View.extend
  templateName: 'auth/sign_in'

  login:    null
  password: null
  remember: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()

    @get('controller').send('authenticate', @get('login'), @get('password'))
