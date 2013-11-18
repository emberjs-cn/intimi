Intimi.ConversationsController = Ember.ArrayController.extend Intimi.Pagable,
  modelName: 'conversation'

  sortProperties: ['latestMessage.createdAt']
  sortAscending: false
