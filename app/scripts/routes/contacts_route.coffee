Intimi.ContactsRoute = Ember.Route.extend
  model: -> @get('store').find('contact', page: 1)

  actions:
    loadMore: -> @get('controller').loadNextPage()
