Intimi.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    applicationController = @controllerFor('application')

    if !localStorage.getItem('intimi:currentUser')
      applicationController.set('savedTransition', transition)
      @transitionTo('login')
    else
      data = JSON.parse localStorage.getItem('intimi:currentUser')
      serializer = @get('store').serializerFor('user')
      data = serializer.extract(@get('store'), Intimi.User, { user: data }, data.id, 'find')
      user = @get('store').push('user', data)
      Intimi.Auth.set('user', user)
      @controllerFor('application').login()

  actions:
    showNewMessagePopup: ->
      @get('controller').set('newMessagePopupVisible', true)

    selectPrepaidCard: ->
      $('.prepaid-cards-modal').modal()
