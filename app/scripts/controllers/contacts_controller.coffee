Intimi.ContactsController = Ember.Controller.extend
  editingMessage: false

  togglePopup: ->
    @toggleProperty('editingMessage')
