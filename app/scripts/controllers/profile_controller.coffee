Intimi.ProfileController = Ember.ObjectController.extend
  revertChanges: ->
    @get('model').rollback() if @get('model.isDirty')

  save: ->
    @get('model').save().then ->
      Notifier.success('个人信息修改成功')
    , -> Notifier.error('个人信息修改失败')
