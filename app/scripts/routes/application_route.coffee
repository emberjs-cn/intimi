Intimi.ApplicationRoute = Ember.Route.extend
  events:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)
