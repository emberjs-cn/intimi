Intimi.ContactsNewRoute = Ember.Route.extend
  model: ->
    contact = @get('store').createRecord('contact')

    contact.set('name', @get('store').createRecord('name', contact: contact))
    contact.get('emails').pushObject(@get('store').createRecord('email', contact: contact))
    contact.get('phones').pushObject(@get('store').createRecord('phone', contact: contact))
    contact.get('faxes').pushObject(@get('store').createRecord('fax', contact: contact))
    contact.get('addresses').pushObject(@get('store').createRecord('address', contact: contact))

    contact

  actions:
    willTransition: ->
      @get('controller.model').rollback()
