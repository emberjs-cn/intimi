Intimi.Address = DS.Model.extend
  addressType: DS.attr('string', defaultValue: '地址')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
