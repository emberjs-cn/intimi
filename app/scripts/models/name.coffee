Intimi.Name = DS.Model.extend
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  additionalName: DS.attr('string')
  prefix: DS.attr('string')
  suffix: DS.attr('string')

  contact: DS.belongsTo('contact')
