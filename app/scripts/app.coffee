NotifierjsConfig.position = ["bottom", "right"]

#Ember.LOG_BINDINGS = true

Intimi = window.Intimi = Ember.Application.create
  LOG_TRANSITIONS: true
  HOST: 'http://localhost:3001'

Intimi.ApplicationAdapter = DS.RESTAdapter.extend
  host: Intimi.HOST
  namespace: 'v1'

# Order and include as you please.
require('scripts/mixins/*')
require('scripts/auth')
require('scripts/helpers/*')
require('scripts/routes/*')
require('scripts/controllers/*')
require('scripts/models/*')
require('scripts/views/*')
require('scripts/router')
require('scripts/lib/*')
