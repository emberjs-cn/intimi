Ember.Handlebars.helper('timeAgo', (value, options) ->
  escaped = Handlebars.Utils.escapeExpression(moment(value).fromNow())
  new Handlebars.SafeString(escaped)
)

