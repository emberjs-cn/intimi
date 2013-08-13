NotifierjsConfig.position = ["bottom", "right"]

Ember.LOG_BINDING = true

Intimi = window.Intimi = Ember.Application.create
  LOG_TRANSITIONS: true
  currentPath: ''

# Order and include as you please.
require('scripts/mixins/*')
require('scripts/auth')
require('scripts/store')
require('scripts/helpers/*')
require('scripts/routes/*')
require('scripts/controllers/*')
require('scripts/models/*')
require('scripts/views/*')
require('scripts/router')
require('scripts/fixtures/*')
require('scripts/lib/*')

Intimi.initializer
  name: 'createDummyData'
  initialize: (container, application) ->
    Intimi.User.find(name: 'intimi').then (users) ->
      if users.get('length') == 0
        user = Intimi.User.createRecord
                 email: 'intimi@example.com'
                 name: 'intimi'
                 password: '123456'
                 realname: 'Intimi'
                 roles: 'admin'
        user.save()

    if Intimi.PrepaidCard.find().get('length') == 0
      for price in [10, 50, 100, 300, 500, 1000]
        Intimi.PrepaidCard.createRecord
          price: price


