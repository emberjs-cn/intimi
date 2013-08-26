Intimi.NewMessagePopupView = Ember.View.extend
  templateName: 'new_message_popup'
  classNameBindings: [':new-message-popup', 'isVisible::hide']

  isVisableBinding: 'controller.newMessagePopupVisible'

  close: ->
    @set 'isVisable', false

  didInsertElement: ->
    @$('.popup-receivers input').focus()

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()

    @get('controller').send('createMessage', @get('numbers'), @get('content'), @get('survey'))

    @setProperties
      numbers: ''
      content: ''
      survey: false

    @close()


