Intimi.User = DS.Model.extend
  email: DS.attr 'string'
  name:  DS.attr 'string'
  realname: DS.attr 'string'
  password: DS.attr 'string'

  mobileAccount: DS.belongsTo('Intimi.MobileAccount')

  registerMobileAccount: ->
    mobileAccount = Intimi.MobileAccount.createRecord()
    mobileAccount.save()
    @set('mobileAccount', mobileAccount)

  changePassword: (oldPwd, newPwd, pwdConfirmation) ->
    self = @
    new Ember.RSVP.Promise (resolve, reject) ->
      return reject('您输入的密码不正确') if oldPwd != self.get('password')
      return reject('您两次输入的新密码不匹配') if newPwd != pwdConfirmation

      self.set('password', newPwd)
      self.save()

      resolve()
