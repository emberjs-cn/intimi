Intimi.Property = DS.Model.extend
  name: DS.attr('string')
  value: DS.attr('string')

  vcard: DS.belongsTo('vcard')
  propertyParameters: DS.hasMany('propertyParameter')
