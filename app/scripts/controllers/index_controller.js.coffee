Intimi.IndexController = Ember.ObjectController.extend
  rechargePopupVisible: false

  prepaidCards: (->
    Intimi.PrepaidCard.find()
  ).property()

  registerMobileAccount: ->
    Intimi.Auth.get('user').registerMobileAccount()

  recharge: ->
    @set('rechargePopupVisible', true)
