Intimi.ContactController = Ember.ObjectController.extend
  actions:
    revertChanges: ->
      @get('model').rollback()

    save: ->
      self = @
      name = @get('model.name')

      @get('model').save().then ->
        ['emails', 'phones', 'faxes', 'addresses'].forEach (items) ->
          self.get('model').get(items).save()

        name.save()

        Notifier.success('保存联系人成功')
        self.transitionToRoute('contact', self.get('model'))
      , -> Notifier.error('保存联系人失败')

    remove: ->
      @get('model').deleteRecord()
      @get('model').save().then =>
        Notifier.success('删除联系人成功')
        @transitionToRoute('contacts')
      , -> Notifier.error('删除联系人失败')

    cancel: ->
      @get('model').rollback()
      @transitionToRoute('contacts')
