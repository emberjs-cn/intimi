Intimi.MobileAccount = DS.Model.extend
  number: DS.attr('string')
  balance: DS.attr('number', defaultValue: 0)

  user: DS.belongsTo('Intimi.User')

  needRecharge: (-> @get('balance') < 10).property('balance')

  available: (-> @get('balance') >= 0.10).property('balance')
