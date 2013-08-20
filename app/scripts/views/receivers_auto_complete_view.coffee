Intimi.ReceiversAutoCompleteView = Ember.TextField.extend
  type: 'hidden'
  classNames: ['input-plain']

  didInsertElement: ->
    controller = @get('controller')

    @$().select2
      multiple: true

      query: (options) ->
        data = { results: [] }
        number = options.term

        controller.findReceivers(number).then (receivers) ->
          receivers.forEach (receiver) ->
            data.results.push(id: receiver.get('number'), text: receiver.get('name'))

          options.callback(data)

  willDestroyElement: ->
    @$().select2('destroy')
