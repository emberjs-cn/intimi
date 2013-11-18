Intimi.Fax = DS.Model.extend
  telType: DS.attr('string', defaultValue: '传真号码')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
