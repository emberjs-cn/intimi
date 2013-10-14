Intimi.ConversationsController = Ember.ArrayController.extend
  currentPage: 1

  sortProperties: ['latestMessage.createdAt']
  sortAscending: false

  totalCount: (->
    count = @get('store').metadataFor('conversation').total
    if @get('model.length') > count then @get('model.length') else count
  ).property('model.length')

  hasMore: (->
    @get('totalCount') > @get('model.length')
  ).property('model.length', 'totalCount')

  loadNextPage: ->
    @get('store').find('conversation', page: @get('currentPage') + 1).then =>
      @set 'model', @get('store').all('conversation')
      @increaseProperty 'currentPage'
