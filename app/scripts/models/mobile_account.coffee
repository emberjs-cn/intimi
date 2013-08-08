Intimi.MobileAccount = DS.Model.extend
  user: DS.belongsTo('Intimi.User')
  balance: DS.attr('number', defaultValue: 0)
  needRecharge: (->
    @get('balance') < 10
  ).property('balance')
