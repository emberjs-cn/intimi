Intimi.ProfileController = Ember.ObjectController.extend
  revertChanges: ->
    @get('model').rollback() if @get('model.isDirty')

  save: ->
    @get('model').save().then ->
      Ember.RSVP.resolve('个人信息修改成功')
    , -> Ember.RSVP.reject('个人信息修改失败')
