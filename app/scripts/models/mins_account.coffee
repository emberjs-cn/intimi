Intimi.MinsAccount = DS.Model.extend
  number: DS.attr('string')

  user: DS.belongsTo('user')
