Intimi.SelectPrepaidCardPopupView = Ember.View.extend
  templateName: 'select_prepaid_card_popup'
  selectedPrepaidCardId: "1"

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()

    # TODO Moved the logic to ApplicationController
    @get('controller.store').find('prepaidCard', @get('selectedPrepaidCardId')).then (card) ->
      user = Intimi.Auth.get('user')
      user.get('minsAccount').recharge(card.get('value'))

    $('.prepaid-cards-modal').modal('hide')
