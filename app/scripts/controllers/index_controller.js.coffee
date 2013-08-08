Intimi.IndexController = Ember.ObjectController.extend
  mobileAccountAlertLevelUp: false

  prepaidCards: (->
    Intimi.PrepaidCard.find()
  ).property()

  registerMobileAccount: ->
    Intimi.Auth.get('user').registerMobileAccount()

    @set('mobileAccountAlertLevelUp', false)
