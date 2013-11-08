Intimi.FileUploadComponent = Ember.Component.extend
  name: '上传文件'
  url: null
  progress: 0
  errorMessage: null

  done: ->
    @$('.fileupload-progress').fadeOut()

  error: ->

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
