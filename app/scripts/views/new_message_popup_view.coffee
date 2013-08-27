Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNameBindings: [':new-message-popup', 'isVisible::hide']

  isVisableBinding: 'controller.newMessagePopupVisible'

  interlocutors: null
  content: null
  needToReply: false

  close: ->
    @set 'isVisable', false

  didInsertElement: ->
    @$('.popup-interlocutors input').focus()

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()

    @get('controller').send 'sendMessage', @get('interlocutors'), @get('content'), @get('needToReply')

    @setProperties
      interlocutors: null
      content: null
      needToReply: false

    @close()


