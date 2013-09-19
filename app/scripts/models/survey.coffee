Intimi.Survey = DS.Model.extend
  content: DS.attr('string')
  attitude:  DS.attr('string')
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')

  confirm: -> @changeAttitude('confirmed')

  reject: -> @changeAttitude('rejected')

  remainNeutral: -> @changeAttitude('neutral')

  changeAttitude: (attitude)->
    @set('attitude', attitude)
    @save()
