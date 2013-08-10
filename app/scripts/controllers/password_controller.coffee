Intimi.PasswordController = Ember.ObjectController.extend
  oldPassword: null
  newPassword: null
  passwordConfirmation: null

  revertChanges: ->
    @setProperties oldPassword: null, newPassword: null, passwordConfirmation: null

  save: ->
    Intimi.Auth.get('user').changePassword(
      @get('oldPassword'),
      @get('newPassword'),
      @get('passwordConfirmation')
    )
