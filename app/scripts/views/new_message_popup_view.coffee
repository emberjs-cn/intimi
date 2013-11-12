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
    @$('.popup-footer a').tooltip()

    @$('#excel-msg-upload').fileupload
      url: '/v1/conversations/upload'
      progressall: (e, data) =>
        @$('.fileupload-progress').fadeIn()
        progress = parseInt(data.loaded / data.total * 100, 10)
        @set('progress', progress)
      done: =>
        @$('.fileupload-progress').fadeOut()
      error: (jqXHR, textStatus, errorThrown) =>
        @set('errorMessage', '上传失败')
        if jqXHR.status == 415
          @set('errorMessage', '上传的文件类型不支持')

        @$('.fileupload-progress').fadeOut()
        @$('.fileupload-error').fadeIn()
        @$('.fileupload-error').delay(3000).fadeOut()

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


