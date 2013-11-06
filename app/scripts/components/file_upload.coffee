Intimi.FileUploadComponent = Ember.Component.extend
  url: ''
  progress: 0

  didInsertElement: ->
    self = @
    Ember.$('#fileupload').fileupload
      url: @get('url')
      progressall: (e, data) ->
        Ember.$('.fileupload-progress').fadeIn()
        progress = parseInt(data.loaded / data.total * 100, 10)
        self.set('progress', progress)
      done: ->
        Ember.$('.fileupload-progress').fadeOut()
      error: (jqXHR, textStatus, errorThrown) ->
        Ember.$('.fileupload-progress').fadeOut()
        Ember.$('.fileupload-error').fadeIn()
        Ember.$('.fileupload-error').delay(2000).fadeOut()
