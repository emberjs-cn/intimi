Ember.onLoad 'Ember.Application', (Application) ->
  Application.initializer
    name: 'createDummyData'
    initialize: (container, application) ->
      store = container.lookup('store:main')

      store.find('user', username: 'intimi').then (users) ->
        return unless Ember.isEmpty(users)

        user = store.createRecord 'user',
                 email: 'intimi@example.com'
                 username: 'intimi'
                 realname: 'Intimi'
                 password: '123456'
                 roles: 'admin'
        user.save()

      store.find('prepaidCard').then (cards) ->
        return unless Ember.isEmpty(cards)

        for value in [10, 50, 100, 300, 500, 1000]
          card = store.createRecord('prepaidCard', name: value + '元', value: value)
          card.save()
