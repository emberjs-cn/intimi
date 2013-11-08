Intimi.ImportContactsComponent = Ember.Component.extend
  name: '导入联系人'
  url: null
  progress: 0
  errorMessage: null

  done: ->
    @get('store').find('contact')
    @$('.fileupload-progress').fadeOut()

  didInsertElement: ->
    @$('#fileupload').fileupload
      url: @get('url')
      progressall: (e, data) =>
        @$('.fileupload-progress').fadeIn()
        progress = parseInt(data.loaded / data.total * 100, 10)
        @set('progress', progress)
      done: => @done()
      error: (jqXHR, textStatus, errorThrown) =>
        @set('errorMessage', '上传失败')
        if jqXHR.status == 415
          @set('errorMessage', '上传的文件类型不支持')

        @$('.fileupload-progress').fadeOut()
        @$('.fileupload-error').fadeIn()
        @$('.fileupload-error').delay(3000).fadeOut()
