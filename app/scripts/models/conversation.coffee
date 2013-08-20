Intimi.Conversation = DS.Model.extend
  messages: DS.hasMany('Intimi.Message')

  user: DS.belongsTo('Intimi.User')
  interlocutor: DS.belongsTo('Intimi.Contact')

  surveys: (->
    @get('messages').find({ survey: true })
  ).property('surveys')
