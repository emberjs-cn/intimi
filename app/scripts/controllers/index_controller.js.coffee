Intimi.IndexController = Ember.ObjectController.extend
  messageServer: true
  activeMessageServer: ->
    model = @get('model')
    model.set('messageServer', true)
