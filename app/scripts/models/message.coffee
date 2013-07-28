Intimi.Message = DS.Model.extend
  content: DS.attr('string')
  direction: DS.attr('string')
  status: DS.attr('string')
  survey: DS.attr('boolean')
  createdAt: DS.attr('date')

  sender: DS.belongsTo('Intimi.Sender')
  receiver: DS.belongsTo('Intimi.Receiver')

  didCreate: ->
    # FIXME Create it if not exist
    contact = Intimi.Contact.find(number: @get('sender.number'))
    contact.incrementProperty('messagesCount')
    contact.set('latestMessage', this)

    # TODO Depends on direction?
    #contact.incrementProperty('notRepliedCount')

    contact.save()
