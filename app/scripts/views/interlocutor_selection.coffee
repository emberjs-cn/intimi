Intimi.InterlocutorSelection = Ember.TextField.extend
  type: 'hidden'
  classNames: ['input-plain']

  didInsertElement: ->
    controller = @get('controller')

    @$().select2
      #tags: []
      #tokenSeparators: [',', ' ']
      multiple: true
      minimumInputLength: 2
      query: (query) =>
        names = Intimi.Name.parseFullName(query.term)
        lastName = names[0]
        firstName = names[1]

        store = Intimi.__container__.lookup('store:main')
        store.find('contact',
          q:
            telephones_faxable_eq: false
            g: [{
              m: 'or',
              telephones_value_matches: '%' + query.term + '%',
              name_first_name_matches: '%' + firstName + '%',
              name_last_name_matches: '%' + lastName + '%'
            }]
        ).then (contacts) ->
          results = contacts.map (contact) ->
            phoneNumber = contact.get('phones.firstObject.value')
            { id: phoneNumber, fullName: contact.get('name.fullName'), phoneNumber: phoneNumber }
          query.callback(results: results)

      formatResult: (contact) ->
        '%@ (%@)'.fmt(contact.fullName, contact.phoneNumber)

      formatSelection: (contact) ->
        '%@ (%@)'.fmt(contact.fullName, contact.phoneNumber)

  willDestroyElement: ->
    @$().select2('destroy')
