NotifierjsConfig.position = ["bottom", "right"]

#Ember.LOG_BINDINGS = true

Intimi = window.Intimi = Ember.Application.create
  LOG_TRANSITIONS: true
  HOST: 'http://localhost:3001'

Intimi.ApplicationAdapter = DS.RESTAdapter.extend
  host: Intimi.HOST
  namespace: 'v1'

  pathForType: (type) ->
    decamelized = Ember.String.decamelize(type)
    Ember.String.pluralize(decamelized)

Intimi.ApplicationSerializer = DS.RESTSerializer.extend
  typeForRoot: (root) ->
    debugger
    camelized = Ember.String.camelize(root)
    Ember.String.singularize(camelized)

  keyForAttribute: (attribute) ->
    debugger
    Ember.String.underscore(attribute)

$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  currentUser = JSON.parse(localStorage.getItem('intimi:currentUser'))
  if currentUser
    options.data = $.param($.extend(originalOptions.data, auth_token: currentUser.authentication_token))

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
