Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNameBindings: [':new-message-popup', 'isVisible::hide']

  isVisableBinding: 'controller.newMessagePopupVisible'

  interlocutors: null
  content: null
  needToReply: false

  actions:
    close: ->
      @set 'isVisable', false

  didInsertElement: ->
    @$('.popup-interlocutors input').focus()

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()

    return Notifier.error '请填写联系人' unless @get('interlocutors')
    return Notifier.error '请填写消息内容' unless @get('content')

    @get('controller').send 'sendMessage', @get('interlocutors'), @get('content'), @get('needToReply')

    @setProperties
      interlocutors: null
      content: null
      needToReply: false

    @send('close')


