Intimi.CapitalAccount = DS.Model.extend
  availableBalance: DS.attr('number', defaultValue: 0)
  frozenAmount: DS.attr('number', defaultValue: 0)

  user: DS.belongsTo('user')

  needToRecharge: (-> @get('availableBalance') < 10).property('availableBalance')

  available: (-> @get('availableBalance') >= 0.10).property('availableBalance')
