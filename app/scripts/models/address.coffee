Intimi.Address = DS.Model.extend
  addressType: DS.attr('string')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
