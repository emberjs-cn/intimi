Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  createMessage: (numberString, content, survey = false) ->
    numbers = numberString.split(',')
    self = this

    numbers.forEach (number) ->
      self.findReceivers(number).then (receiver) ->
        message = Intimi.Message.createRecord
          content: content
          survey: survey
          receiver: receiver.get('firstObject')
          # sender: currentUser # FIXME get currentUser

        message.save()

  findReceivers: (number) ->
    Intimi.Receiver.find(number: number)
