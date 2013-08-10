Intimi.UserController = Ember.ObjectController.extend
  revertChanges: ->
    @get('model').rollback() if @get('model.isDirty')

  save: ->
    self = @
    @get('model').save().then ->
      Notifier.success('保存用户成功')
      self.transitionToRoute('user', self.get('model'))
    , -> Notifier.error('保存用户失败')

  remove: ->
    if @get('model.id') == Intimi.Auth.get('user.id')
      return Notifier.error('对不起，您不允许删除自己！')

    @get('model').deleteRecord()
    @get('store').commit()
    @transitionToRoute('users')

  cancel: ->
    @get('model').deleteRecord()
    @transitionToRoute('users')
