NotifierjsConfig.position = ["bottom", "right"]

Ember.LOG_BINDINGS = true

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

require('scripts/initializers/*')
