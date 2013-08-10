Intimi.Role = DS.Model.extend
  name: DS.attr 'string'

  user: DS.belongsTo 'Intimi.User'
