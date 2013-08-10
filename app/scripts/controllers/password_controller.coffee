Intimi.PasswordController = Ember.ObjectController.extend
  oldPassword: null
  newPassword: null
  passwordConfirmation: null

  revertChanges: ->
    @setProperties oldPassword: null, newPassword: null, passwordConfirmation: null

  save: ->
    self = @
    Intimi.Auth.get('user').changePassword(
      @get('oldPassword'),
      @get('newPassword'),
      @get('passwordConfirmation')
    ).then (successMsg) ->
      Notifier.success('修改密码成功')
      self.revertChanges()
    , (errorMsg) -> Notifier.error(errorMsg)

