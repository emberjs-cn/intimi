Intimi.User = DS.Model.extend
  email:               DS.attr('string')
  username:            DS.attr('string')
  realname:            DS.attr('string')
  password:            DS.attr('string')
  accessLocked:        DS.attr('boolean')
  authenticationToken: DS.attr('string')
  roles:               DS.attr('string', defaultValue: 'user')

  minsAccount: DS.belongsTo('minsAccount')
  capitalAccount: DS.belongsTo('capitalAccount')

  availableRoles: (->
    ['admin', 'user']
  ).property().readOnly()

  registerMinsAccount: ->
    $.post(Intimi.HOST + '/v1/mins_accounts/register').then (payload) =>
      serializer = @get('store').serializerFor('minsAccount')
      data = serializer.extract(@get('store'), Intimi.MinsAccount, payload, payload.mins_account.id, 'find')
      @get('store').push('minsAccount', data)

  changePassword: (oldPwd, newPwd, pwdConfirmation) ->
    $.ajax(
      url: Intimi.HOST + '/v1/password',
      type: 'PUT',
      data:
        password:
          current_password: oldPwd
          password: newPwd
          password_confirmation: pwdConfirmation
    )

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
