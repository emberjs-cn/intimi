Intimi.SelectPrepaidCardPopupView = Ember.View.extend
  templateName: 'select_prepaid_card_popup'
  selectedPrepaidCardId: "1"

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()

    # TODO Moved the logic to ApplicationController
    @get('controller.store').find('prepaidCard', @get('selectedPrepaidCardId')).then (card) =>
      income = @get('controller.store').createRecord 'income', title: '充值', amount: card.get('value')
      income.save().then ->
        window.open income.get('alipayUrl')

    $('.prepaid-cards-modal').modal('hide')
