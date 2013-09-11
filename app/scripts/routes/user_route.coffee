Intimi.UserRoute = Ember.Route.extend
  actions:
    willTransition: ->
      @get('controller.model').rollback()
