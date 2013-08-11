Intimi.User = DS.Model.extend
  email:    DS.attr('string')
  name:     DS.attr('string')
  realname: DS.attr('string')
  password: DS.attr('string')
  roles:    DS.attr('string', defaultValue: 'user')

  contacts: DS.hasMany('Intimi.Contact')

  availableRoles: (->
    ['admin', 'user']
  ).property().readOnly()

  mobileAccount: DS.belongsTo 'Intimi.MobileAccount'

  registerMobileAccount: ->
    mobileAccount = Intimi.MobileAccount.createRecord(number: 10657500123400 + Math.round(Math.random() * 100))
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

  hasRole: (roles, matchMode) ->
    roles = [roles] if typeof(roles) == 'string'

    self = @
    match = false
    if matchMode == 'any'
      roles.forEach (role) ->
        if self.get('roles') && self.get('roles').split(', ').contains(role)
          match = true
          return false
    else
      roles.forEach (role) ->
        if !self.get('roles') || !self.get('roles').split(', ').contains(role)
          match = false
          return false

    match
