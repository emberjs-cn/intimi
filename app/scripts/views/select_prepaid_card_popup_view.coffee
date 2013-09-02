Intimi.SelectPrepaidCardPopupView = Ember.View.extend
  templateName: 'select_prepaid_card_popup'
  selectedPrepaidCardId: "1"

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()

    # TODO Moved the logic to ApplicationController
    prepaidCard = @get('controller.store').find(Intimi.PrepaidCard, @get('selectedPrepaidCardId'))
    user = Intimi.Auth.get('user')
    balance = user.get('minsAccount.balance')
    user.set("minsAccount.balance", balance + prepaidCard.get('price'))

    $('#selectPrepaidCardModal').modal('hide')
