Intimi.IndexController = Ember.ObjectController.extend
  activeMessageServer: ->
    model = @get('model')
    model.set('messageServer', true)
  recharge: ->
    model = @get('model')
    model.set('balance', 1000)
