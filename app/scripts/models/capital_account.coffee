Intimi.CapitalAccount = DS.Model.extend
  balance: DS.attr('number', defaultValue: 0)

  user: DS.belongsTo('user')

  needToRecharge: (-> @get('balance') < 10).property('balance')

  available: (-> @get('balance') >= 0.10).property('balance')
