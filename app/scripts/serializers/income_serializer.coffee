Intimi.IncomeSerializer = Intimi.ApplicationSerializer.extend
  keyForAttribute: (attr) ->
    if attr == 'account_id'
      'capitalAccountId'
    else
      @_super(attr)
