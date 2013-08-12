Intimi.SelectPrepaidCardPopupView = Ember.View.extend
  templateName: 'select_prepaid_card_popup'
  selectedPrepaidCardId: "1"

  submit: (event) ->
    prepaid_card = Intimi.PrepaidCard.find(@get('selectedPrepaidCardId'))
    user = Intimi.Auth.get('user')
    balance = user.get('mobileAccount.balance')
    user.set("mobileAccount.balance", balance + prepaid_card.get('price'))

    $('#selectPrepaidCardModal').modal('hide')

    event.preventDefault()
    event.stopPropagation()
