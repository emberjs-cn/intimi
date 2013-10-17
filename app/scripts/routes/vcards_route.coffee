Intimi.VcardsRoute = Ember.Route.extend
  model: -> @get('store').find('vcard')
