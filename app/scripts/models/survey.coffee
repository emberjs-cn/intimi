Intimi.Survey = DS.Model.extend
  attitude:  DS.attr('string')
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')

  message: DS.belongsTo('Intimi.Message')

  confirm: -> @changeAttitude('confirmed')

  reject: -> @changeAttitude('rejected')

  neutral: -> @changeAttitude('neutral')

  changeAttitude: (attitude)->
    @set('attitude', attitude)
    @save()
