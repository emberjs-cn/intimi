Intimi.Message = DS.Model.extend
  content: DS.attr('string')
  direction: DS.attr('string')
  status: DS.attr('string')
  survey: DS.attr('boolean')
  createdAt: DS.attr('date')

  sender: DS.belongsTo('Intimi.Sender')
  receiver: DS.belongsTo('Intimi.Receiver')

  conversation: DS.belongsTo('Intimi.Conversation')

  didCreate: ->
    number = if isOut
      @get('receiver.number')
    else
      @get('sender.number')

    # FIXME Create it if not exist
    contact = Intimi.Contact.find(number: number)

    contact.set('latestMessage', this)
    contact.incrementProperty('messagesCount')
    contact.incrementProperty('notRepliedCount') if isOut and survey

    contact.save()

  isIn: ->
    @get('direction') == 'in'

  isOut: ->
    @get('direction') == 'out'
