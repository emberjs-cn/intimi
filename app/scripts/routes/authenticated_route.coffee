Intimi.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor('application')

    if localStorage.currentUsername
      @get('store').find('user', username: localStorage.currentUsername).then (users) =>
        Intimi.Auth.set('user', users.get('firstObject'))
        @controllerFor('application').login()
    else
      applicationController.set('savedTransition', transition)
      @transitionTo('login')

  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)

    selectPrepaidCard: ->
      $('.prepaid-cards-modal').modal()
