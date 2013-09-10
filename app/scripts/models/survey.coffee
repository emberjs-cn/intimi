Intimi.Survey = DS.Model.extend
  attitude:  DS.attr('string')
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')

  message: DS.belongsTo('message')
  conversation: DS.belongsTo('conversation')

  confirm: -> @changeAttitude('confirmed')

  reject: -> @changeAttitude('rejected')

  remainNeutral: -> @changeAttitude('neutral')

  changeAttitude: (attitude)->
    @set('attitude', attitude)
    @save()
