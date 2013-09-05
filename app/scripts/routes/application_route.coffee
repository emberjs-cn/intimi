Intimi.ApplicationRoute = Ember.Route.extend
  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)
