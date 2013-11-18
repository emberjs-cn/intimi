Intimi.ConversationPollster =
  start: (conversation) ->
    @conversation = conversation
    @timer = setInterval(@onPoll.bind(@), 5000)

    console.log('ConversationPollster started')

  stop: ->
    if @timer
      clearInterval(@timer)

      console.log('ConversationPollster stopped')

  onPoll: -> @conversation.reload()
