Intimi.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor('application')

    userHash = localStorage.getItem('intimi:currentUser')
    if userHash && userHash != 'null'
      @controllerFor('application').login()
    else
      applicationController.set('savedTransition', transition)
      @transitionTo('login')

  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)

    selectPrepaidCard: ->
      $('.prepaid-cards-modal').modal()
