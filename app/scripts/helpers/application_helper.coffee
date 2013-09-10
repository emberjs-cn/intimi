Ember.Handlebars.helper('timeAgo', (value, options) ->
  return unless value

  escaped = Handlebars.Utils.escapeExpression(moment(value).fromNow())
  new Handlebars.SafeString(escaped)
)

