Intimi.Income = DS.Model.extend
  title:       DS.attr('string')
  amount:      DS.attr('number')
  description: DS.attr('string')
  status:      DS.attr('string')
  createdAt:   DS.attr('date')
  alipayUrl:   DS.attr('string')

  capitalAccount: DS.belongsTo('capitalAccount')
