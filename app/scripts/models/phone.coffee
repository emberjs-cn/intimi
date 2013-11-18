Intimi.Phone = DS.Model.extend
  telType: DS.attr('string', defaultValue: '手机号码')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
