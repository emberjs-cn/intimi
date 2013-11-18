Intimi.Pagable = Ember.Mixin.create
  currentPage: 1

  totalCount: (->
    count = @get('store').metadataFor(@get('modelName')).total
    if @get('model.length') > count then @get('model.length') else count
  ).property('model.length')

  hasMore: (->
    @get('totalCount') > @get('model.length')
  ).property('model.length', 'totalCount')

  loadNextPage: ->
    @get('store').find(@get('modelName'), page: @get('currentPage') + 1).then =>
      @set 'model', @get('store').all(@get('modelName'))
      @set 'currentPage', @get('currentPage') + 1
