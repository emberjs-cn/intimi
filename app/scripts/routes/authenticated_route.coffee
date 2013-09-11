Intimi.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor('application')

    # or check a cookie, or other state
    if !Intimi.Auth.user
      applicationController.set('savedTransition', transition)
      @transitionTo('login')
    else
      @controllerFor('application').login()

  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)

    selectPrepaidCard: ->
      $('.prepaid-cards-modal').modal()
