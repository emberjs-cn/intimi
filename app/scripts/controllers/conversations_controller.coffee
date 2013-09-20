Intimi.ConversationsController = Ember.ArrayController.extend
  currentPage: 1

  totalCount: (->
    @get('store').metadataFor('conversation').total
  ).property().volatile()

  hasMore: (->
    @get('totalCount') > @get('model.length')
  ).property('model.length', 'totalCount')

  loadNextPage: ->
    @get('store').find('conversation', page: @get('currentPage') + 1).then =>
      @set 'model', @get('store').all('conversation')
      @increaseProperty 'currentPage'
