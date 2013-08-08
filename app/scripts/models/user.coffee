Intimi.User = DS.Model.extend
  email: DS.attr('string')
  name: DS.attr('string')
  mobileAccount: DS.belongsTo('Intimi.MobileAccount')
