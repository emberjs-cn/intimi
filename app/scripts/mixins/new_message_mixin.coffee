Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  createMessage: (receivers, content, survey = false) ->
    receivers = [] # FIXME Find receivers

    receivers.forEach (receiver) ->
      message = Intimi.Message.createRecord({
        content: content
        survey: survey
        receiver: receiver
        # sender: currentUser # FIXME get currentUser
      })

      message.save()

