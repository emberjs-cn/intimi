Intimi.Message = DS.Model.extend
  content: DS.attr('string')
  direction: DS.attr('string', defaultValue: 'out')
  status: DS.attr('string', defaultValue: 'pending')
  needToReply: DS.attr('boolean', defaultValue: false)
  createdAt: DS.attr('date')

  conversation: DS.belongsTo('conversation')
  survey: DS.belongsTo('survey')

  isIn: (->
    @get('direction') == 'in'
  ).property('direction')

  isOut: (->
    @get('direction') == 'out'
  ).property('direction')
