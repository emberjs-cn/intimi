Intimi.ContactsRoute = Ember.Route.extend
  beforeModel: ->
    unless Intimi.Auth.get('user.mobileAccount.available')
      Ember.RSVP.reject('MobileAccount not available')

  model: -> Intimi.Contact.find()

  events:
    error: ->
      @controllerFor('index').set('mobileAccountAlertLevelUp', true)
      @transitionTo('/')
