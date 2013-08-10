Intimi.UsersNewRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('user').set 'model', Intimi.User.createRecord(name: '空', email: '空')

  renderTemplate: ->
    @render 'users/new', controller: 'user'
