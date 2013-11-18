Intimi.ContactsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      self = @
      name = @get('model.name')

      @get('model').save().then ->
        Notifier.success('保存联系人成功')
        self.transitionToRoute('contact', self.get('model'))
      , -> Notifier.error('保存联系人失败')

      @get('model').one 'didCreate', ->
        ['emails', 'phones', 'faxes', 'addresses'].forEach (items) ->
          self.get('model').get(items).save()

        name.save().then -> self.get('model').set('name', name)

    cancel: ->
      @get('model').rollback()
      @transitionToRoute('contacts')
