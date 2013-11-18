NotifierjsConfig.position = ["bottom", "right"]

Ember.RSVP.configure 'onerror', (error) ->
  Ember.Logger.assert(false, error)


Intimi = window.Intimi = Ember.Application.create
  LOG_TRANSITIONS: true
  HOST: 'http://localhost:9292'

Intimi.Auth = Ember.Object.create()

Intimi.ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: Intimi.HOST
  namespace: 'v1'

Intimi.ApplicationSerializer = DS.ActiveModelSerializer.extend()

$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  currentUser = JSON.parse(localStorage.getItem('intimi:currentUser'))
  if currentUser
    if options.url.indexOf('?') >= 0
      options.url += '&auth_token=' + currentUser.authentication_token
    else
      options.url += '?auth_token=' + currentUser.authentication_token

  return false

# Order and include as you please.
require('scripts/mixins/*')
require('scripts/pollsters/*')
require('scripts/components/*')
require('scripts/serializers/*')
require('scripts/auth')
require('scripts/helpers/*')
require('scripts/routes/*')
require('scripts/controllers/*')
require('scripts/models/*')
require('scripts/views/*')
require('scripts/router')
require('scripts/lib/*')
