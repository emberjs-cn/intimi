Intimi.IndexController = Ember.ObjectController.extend
  mobileAccountAlertLevelUp: false

  prepaidCards: (->
    if Intimi.PrepaidCard.find().get('length') == 0
      for prepaid_card in Intimi.PrepaidCard.FIXTURES
        Intimi.PrepaidCard.createRecord
          price: prepaid_card.price
    Intimi.PrepaidCard.find()
  ).property()

  registerMobileAccount: ->
    Intimi.Auth.get('user').registerMobileAccount()

    @set('mobileAccountAlertLevelUp', false)
