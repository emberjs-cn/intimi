Intimi.ContactsRoute = Ember.Route.extend
  model: -> @get('store').find('contact')
