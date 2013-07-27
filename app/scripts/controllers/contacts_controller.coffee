Intimi.ContactsController = Ember.Controller.extend
  needs: ['new_message']

  togglePopup: ->
    @get('controllers.new_message').toggleProperty('editingMessage')
