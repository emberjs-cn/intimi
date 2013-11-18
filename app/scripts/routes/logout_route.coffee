Intimi.LogoutRoute = Ember.Route.extend
  setupController: ->
    $.ajax(type: 'DELETE', url: Intimi.HOST + '/users/sign_out').then =>
      @controllerFor('application').logout()
      @transitionTo('login')
    , -> Notifier.error('注销失败')
