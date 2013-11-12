Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNameBindings: [':new-message-popup', 'isVisible::hide']

  isVisableBinding: 'controller.newMessagePopupVisible'

  interlocutors: null
  content: null
  needToReply: false

  total: 0
  titles: []
  inBatchMode: false

  actions:
    close: ->
      @set 'isVisable', false

  didInsertElement: ->
    @$('.popup-interlocutors input').focus()
    @$('.popup-footer a').tooltip()

    @$('#excel-msg-upload').fileupload
      url: Intimi.HOST + '/v1/sms_messages/upload'
      progressall: (e, data) =>
        @$('.fileupload-progress').fadeIn()
        progress = parseInt(data.loaded / data.total * 100, 10)
        @set('progress', progress)
      done: (e, data) =>
        if data.result.total > 0
          @set('inBatchMode', true)
          @set('total', data.result.total)
          @set('titles', data.result.titles)

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

    return Notifier.error '请填写消息内容' unless @get('content')

    if @get('inBatchMode')
      @get('controller').send 'sendMessageInBatchMode', @get('content'), @get('needToReply')
    else
      return Notifier.error '请填写联系人' unless @get('interlocutors')

      @get('controller').send 'sendMessage', @get('interlocutors'), @get('content'), @get('needToReply')

    @setProperties
      interlocutors: null
      content: null
      needToReply: false
      total: 0
      titles: []
      inBatchMode: false

    @send('close')


