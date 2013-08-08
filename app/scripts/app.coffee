Ember.LOG_BINDING = true

Intimi = window.Intimi = Ember.Application.create
  LOG_TRANSITIONS: true

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
