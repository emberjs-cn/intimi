Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  account: DS.belongsTo('Intimi.MobileAccount')

  messages: DS.hasMany('Intimi.Message')
  surveys:  DS.hasMany('Intimi.Survey')

  notRepliedSurveys: (->
    @get('surveys').filterProperty('attitude', null)
  ).property('surveys.@each.attitude')
