Intimi.initializer
  name: 'createDummyData'
  initialize: (container, application) ->
    store = container.lookup('store:main')

    store.find(Intimi.User, name: 'intimi').then (users) ->
      return unless users.get('length') == 0

      user = Intimi.User.createRecord
               email: 'intimi@example.com'
               name: 'intimi'
               password: '123456'
               realname: 'Intimi'
               roles: 'admin'
      user.save()

    store.find(Intimi.PrepaidCard).then (cards) ->
      return unless cards.get('length') == 0

      for price in [10, 50, 100, 300, 500, 1000]
        Intimi.PrepaidCard.createRecord
          price: price
