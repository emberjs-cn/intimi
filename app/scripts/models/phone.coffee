Intimi.Phone = DS.Model.extend
  telType: DS.attr('string')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
