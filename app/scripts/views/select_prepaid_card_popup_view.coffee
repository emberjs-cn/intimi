Intimi.SelectPrepaidCardPopupView = Ember.View.extend
  templateName: 'select_prepaid_card_popup'
  selectedPrepaidCardId: "1"

  radioButton: (->
    popupView = @

    Ember.View.extend
      tagName: 'input'
      type: 'radio'
      attributeBindings: ['type', 'name', 'value', 'checked']

      name: 'prepaidCardId'
      selectedValueBinding: '1'

      init: ->
        @_super()
        @initSelectedValue()

      initSelectedValue: Ember.observer(->
        @set('checked', @get('value') == popupView.get('selectedPrepaidCardId'))
      , 'selectedPrepaidCardId')

      click: ->
        popupView.set('selectedPrepaidCardId', @$().val())
    ).property()

  submit: (event) ->
    prepaid_card = Intimi.PrepaidCard.find(@get('selectedPrepaidCardId'))
    user = Intimi.Auth.get('user')
    balance = user.get('mobileAccount.balance')
    user.set("mobileAccount.balance", balance + prepaid_card.get('price'))

    $('#selectPrepaidCardModal').modal('hide')

    event.preventDefault()
    event.stopPropagation()
