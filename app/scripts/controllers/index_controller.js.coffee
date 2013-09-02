Intimi.IndexController = Ember.ObjectController.extend
  minsAccountAlertLevelUp: false

  prepaidCards: (->
   @get('store').find(Intimi.PrepaidCard)
  ).property()

  registerMinsAccount: ->
    Intimi.Auth.get('user').registerMinsAccount()

    @set('minsAccountAlertLevelUp', false)
