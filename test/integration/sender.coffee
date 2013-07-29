describe "Sender page", ->
  it "displays active message server", ->
    visit('/sender').then ->
      find('.inkylike-main').text().should.equal "\n  \n  抱歉! 您还未开通即时通知服务, 开通后即可使用短信、彩信与您的好友取得联系。是否现在开通服务\n\n\n"
    .click("a:contains('开通服务')")
    .then ->
      find('.inkylike-main').text().should.equal '\n  \n  \n    你的账户余额只有0元, 是否立即充值\n  \n\n\n'
    .click("a:contains('立即充值')")
    .then ->
      find('.inkylike-main').text().should.equal '\n  \n  \n    你的账户余额为1000元。\n  \n\n\n'
