Intimi.MobileAccount = DS.Model.extend
  sender: DS.belongsTo('Intimi.Sender')
  balance: DS.attr('number')
  notificationService: DS.attr('boolean')
  needRecharge: (->
    @get('balance') < 10
  ).property('balance')

