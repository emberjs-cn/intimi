Intimi.Email = DS.Model.extend
  emailType: DS.attr('string', defaultValue: '电子邮箱')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
