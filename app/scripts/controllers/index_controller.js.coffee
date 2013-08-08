Intimi.IndexController = Ember.ObjectController.extend
  prepaidCards: (->
    Intimi.PrepaidCard.find()
  ).property()

  registerMobileAccount: ->
    Intimi.Auth.get('user').registerMobileAccount()
