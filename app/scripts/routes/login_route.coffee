Intimi.LoginRoute = Ember.Route.extend
  actions:
    login: ->
      loginController = @controllerFor('login')
      username = loginController.get('username')
      password = loginController.get('password')

      $.post(Intimi.HOST + '/users/sign_in.json', user: { login: username, password: password }).then (payload) =>
        localStorage.setItem('intimi:currentUser', JSON.stringify(payload.user))

        applicationController = @controllerFor('application')
        transition = applicationController.get('savedTransition')

        user = @get('store').push('user', payload.user)
        Intimi.Auth.set 'user', user

        applicationController.login()

        # if the user was going somewhere, send them along, otherwise
        # default to `/home`
        if transition && transition.get('targetName') != 'authenticated.index'
          transition.retry()
        else
          @transitionTo('home')
      , -> Notifier.error('您输入的用户名或密码不正确')
