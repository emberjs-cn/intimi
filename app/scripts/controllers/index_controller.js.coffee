Intimi.IndexController = Ember.ObjectController.extend
  minsAccountAlertLevelUp: false

  prepaidCards: (->
   Intimi.PrepaidCard.find()
  ).property()

  registerMinsAccount: ->
    Intimi.Auth.get('user').registerMinsAccount()

    @set('minsAccountAlertLevelUp', false)
