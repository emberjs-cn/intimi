Intimi.Contact = DS.Model.extend
  title: DS.attr('string')
  organization: DS.attr('string')
  groupList: DS.attr('string')
  note: DS.attr('string')

  name: DS.belongsTo('name')
  emails: DS.hasMany('email')
  phones: DS.hasMany('phone')
  faxes: DS.hasMany('fax')
  addresses: DS.hasMany('address')

  rollback: ->
    ['emails', 'phones', 'faxes', 'addresses'].forEach (items) =>
      @get(items).forEach (item) -> item.rollback()

    @_super()
