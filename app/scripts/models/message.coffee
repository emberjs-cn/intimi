Intimi.Message = DS.Model.extend
  content: DS.attr('string')
  direction: DS.attr('string')
  status: DS.attr('string')
  survey: DS.attr('boolean')
  createdAt: DS.attr('date')

  sender: DS.belongsTo('Intimi.Sender')
  receiver: DS.belongsTo('Intimi.Receiver')
