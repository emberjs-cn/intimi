Intimi.ContactsRoute = Ember.Route.extend
  model: ->
    @get('store').find('contact', page: 1)
    @get('store').all('contact')

  actions:
    loadMore: -> @get('controller').loadNextPage()
