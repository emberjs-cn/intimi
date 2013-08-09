Intimi.User = DS.Model.extend
  email: DS.attr 'string'
  name:  DS.attr 'string'
  password: DS.attr 'string'

  mobileAccount: DS.belongsTo('Intimi.MobileAccount')

  registerMobileAccount: ->
    mobileAccount = Intimi.MobileAccount.createRecord()
    mobileAccount.save()
    @set('mobileAccount', mobileAccount)
