Intimi.Email = DS.Model.extend
  emailType: DS.attr('string')
  value: DS.attr('string')

  contact: DS.belongsTo('contact')
