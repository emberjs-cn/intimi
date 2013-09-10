Intimi.MinsAccount = DS.Model.extend
  number: DS.attr('string')
  balance: DS.attr('number', defaultValue: 0)

  needRecharge: (-> @get('balance') < 10).property('balance')

  available: (-> @get('balance') >= 0.10).property('balance')

  recharge: (money) ->
    @incrementProperty('balance', money)
    @save()
