Intimi.UsersNewRoute = Ember.Route.extend
  controllerName: 'user'

  setupController: ->
    @controllerFor('user').set 'model', @get('store').createRecord('user', email: '空', username: '空', realname: '空')

  actions:
    willTransition: ->
      @get('controller.model').rollback()
