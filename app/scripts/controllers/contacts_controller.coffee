Intimi.ContactsController = Ember.ArrayController.extend Intimi.Pagable,
  modelName: 'contact'

  sortProperties: ['id']
  sortAscending: false
