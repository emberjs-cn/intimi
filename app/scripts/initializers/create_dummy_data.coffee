Ember.onLoad 'Ember.Application', (Application) ->
  Application.initializer
    name: 'createDummyData'
    initialize: (container, application) ->
      store = container.lookup('store:main')

      store.find('user', name: 'intimi').then (users) ->
        return unless Ember.isEmpty(users)

        console.log 'Create a default user'

        user = store.createRecord 'user',
                 email: 'intimi@example.com'
                 name: 'intimi'
                 password: '123456'
                 realname: 'Intimi'
                 roles: 'admin'
        user.save()

      store.find('prepaidCard').then (cards) ->
        return unless Ember.isEmpty(cards)

        console.log 'Create prepaid cards'
        for price in [10, 50, 100, 300, 500, 1000]
          card = store.createRecord('prepaidCard', price: price)
          card.save()
