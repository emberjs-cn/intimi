Intimi.HomeController = Ember.ObjectController.extend
  minsAccountAlertLevelUp: false

  prepaidCards: (->
    @get('store').find('prepaidCard')
  ).property()

  actions:
    registerMinsAccount: ->
      Intimi.Auth.get('user').registerMinsAccount()

      @set('minsAccountAlertLevelUp', false)
