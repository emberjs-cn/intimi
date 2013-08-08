Intimi.IndexController = Ember.ObjectController.extend
  currentUser: (->
    Intimi.User.find(1)
  ).property()

  prepaidCards: (->
    Intimi.PrepaidCard.find()
  ).property()

  enableNotificationService: ->
    mobileAccount = Intimi.MobileAccount.createRecord()
    mobileAccount.save()
    @set('currentUser.mobileAccount', mobileAccount)

  recharge: ->
    @set('currentUser.mobileAccount.balance', 1000)
