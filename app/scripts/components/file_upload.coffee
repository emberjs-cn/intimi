Intimi.FileUploadComponent = Ember.Component.extend
  url: null
  progress: 0
  errorMessage: null

  didInsertElement: ->
    Ember.$('#fileupload').fileupload
      url: @get('url')
      progressall: (e, data) =>
        Ember.$('.fileupload-progress').fadeIn()
        progress = parseInt(data.loaded / data.total * 100, 10)
        @set('progress', progress)
      done: ->
        Ember.$('.fileupload-progress').fadeOut()
      error: (jqXHR, textStatus, errorThrown) =>
        @set('errorMessage', '上传失败')
        if jqXHR.status == 415
          @set('errorMessage', '仅支持csv、xls、xlsx类型')

        Ember.$('.fileupload-progress').fadeOut()
        Ember.$('.fileupload-error').fadeIn()
        Ember.$('.fileupload-error').delay(3000).fadeOut()
