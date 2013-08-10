Intimi.SettingsController = Ember.ObjectController.extend
  needs: ['password']
  revertChanges: ->
    controllerName = Intimi.get('currentPath').replace(/settings\./, '')
    @get('controllers.' + controllerName).revertChanges()
