Intimi.HomeController = Ember.ObjectController.extend
  minsAccountAlertLevelUp: false

  actions:
    registerMinsAccount: ->
      Intimi.Auth.get('user').registerMinsAccount()

      @set('minsAccountAlertLevelUp', false)
