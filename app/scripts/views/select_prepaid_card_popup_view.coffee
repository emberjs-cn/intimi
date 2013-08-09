Intimi.SelectPrepaidCardPopupView = Ember.View.extend
  templateName: 'select_prepaid_card_popup'

  submit: (event) ->
    user = Intimi.Auth.get('user')
    #TODO
    user.set("mobileAccount.balance", 100)
    $('#selectPrepaidCardModal').modal('hide')

    event.preventDefault()
    event.stopPropagation()
