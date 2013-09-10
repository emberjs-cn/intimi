Intimi.HistoryMessages = Ember.View.extend
  templateName: 'history_messages'
  classNames: ['messages']

  needAReply: false
  newMessageContent: null

  didInsertElement: ->
    @scrollToBottom()

  scrollToBottom: (->
    @$('.content').scrollTop(@$('.content')[0].scrollHeight)
  ).observes('controller.messages.length')

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()

    @get('controller').send('sendMessage', @get('newMessageContent'), @get('needAReply'))

    @setProperties(newMessageContent: null, needAReply: false)

