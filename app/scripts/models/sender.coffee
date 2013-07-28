Intimi.Sender = Intimi.BaseContact.extend
  messageServer: DS.attr('boolean')
  balance: DS.attr('balance')
  needRecharge: (->
    @get('balance') < 10
  ).property("balance")
