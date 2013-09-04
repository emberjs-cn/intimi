Intimi.UsersNewRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('user').set 'model', @get('store').createRecord('user', email: '空', name: '空', realname: '空')

  renderTemplate: ->
    @render 'users/new', controller: 'user'
