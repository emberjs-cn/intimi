Intimi.Message = DS.Model.extend
  content: DS.attr('string')
  direction: DS.attr('string', defaultValue: 'out')
  status: DS.attr('string', defaultValue: 'pending')
  createdAt: DS.attr('date')

  conversation: DS.belongsTo('conversation')

  isIn: (->
    @get('direction') == 'in'
  ).property('direction')

  isOut: (->
    @get('direction') == 'out'
  ).property('direction')
