Intimi.Contact = Intimi.BaseContact.extend
  notRepliedCount: DS.attr('number')
  messagesCount: DS.attr('number')

  latestMessage: DS.belongsTo('Intimi.Message')
  user: DS.belongsTo('Intimi.User')
  conversation: DS.belongsTo('Intimi.Conversation', {
    inverse: 'interlocutor'
  })
