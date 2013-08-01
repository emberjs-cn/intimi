Intimi.IndexController = Ember.ObjectController.extend
  currentUser: (->
    Intimi.Sender.find(1)
  ).property()

  activeNotificationService: ->
    @set('currentUser.mobileAccount.notificationService', true)

  recharge: ->
    @set('currentUser.mobileAccount.balance', 1000)
