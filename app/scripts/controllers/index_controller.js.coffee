Intimi.IndexController = Ember.ObjectController.extend
  mobileAccountAlertLevelUp: false
  prepaidCardId: 1

  prepaidCards: (->
    Intimi.PrepaidCard.find()
  ).property()

  registerMobileAccount: ->
    Intimi.Auth.get('user').registerMobileAccount()

    @set('mobileAccountAlertLevelUp', false)
