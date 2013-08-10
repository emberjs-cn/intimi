Intimi.SettingsController = Ember.ObjectController.extend
  needs: ['password']

  revertChanges: -> @_getCurrentController().revertChanges()

  save: ->
    @_getCurrentController().save().then (successMsg)->
      Notifier.success(successMsg)
    , (errorMsg) -> Notifier.error(errorMsg)

  _getCurrentController: ->
    controllerName = Intimi.get('currentPath').replace(/settings\./, '')
    @get('controllers.' + controllerName)
