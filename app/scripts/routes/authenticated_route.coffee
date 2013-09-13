Intimi.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor('application')

    # or check a cookie, or other state
    if !localStorage.getItem('intimi:currentUser')
      applicationController.set('savedTransition', transition)
      @transitionTo('login')
    else
      data = JSON.parse localStorage.getItem('intimi:currentUser')
      user = @get('store').push('user', data)
      Intimi.Auth.set('user', user)
      @controllerFor('application').login()

  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)

    selectPrepaidCard: ->
      $('.prepaid-cards-modal').modal()
