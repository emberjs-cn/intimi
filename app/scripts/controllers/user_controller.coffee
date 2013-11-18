Intimi.UserController = Ember.ObjectController.extend
  actions:
    revertChanges: ->
      @get('model').rollback() if @get('model.isDirty')

    save: ->
      @get('model').save().then =>
        Notifier.success('保存用户成功')
        @transitionToRoute('user', @get('model'))
      , -> Notifier.error('保存用户失败')

    remove: ->
      if @get('model.id') == Intimi.Auth.get('user.id')
        return Notifier.error('对不起，您不允许删除自己！')

      @get('model').deleteRecord()
      @get('model').save().then =>
        Notifier.success('删除用户成功')
        @transitionToRoute('users')
      , -> Notifier.error('删除用户失败')

    cancel: ->
      @get('model').rollback()
      @transitionToRoute('users')
