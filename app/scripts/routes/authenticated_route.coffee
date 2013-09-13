Intimi.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor('application')

    if !localStorage.getItem('intimi:currentUser')
      applicationController.set('savedTransition', transition)
      @transitionTo('login')
    else
      @controllerFor('application').login()

  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)

    selectPrepaidCard: ->
      $('.prepaid-cards-modal').modal()
