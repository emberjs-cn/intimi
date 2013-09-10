describe "Index page", ->
  it "displays a welcome message", ->
    visit('/').then ->
      find('.logo').text().should.equal 'Intimi',

  it "displays mobile message server", ->
    visit('/').then ->
      find('.center').text().should.match /抱歉! 您还未开通即时通知服务, 开通后即可使用短信、彩信与您的好友取得联系。是否现在开通服务/
    .click("a:contains('开通服务')")
    .then ->
      #find('.inkylike-main').text().should.equal '\n  \n  \n    你的账户余额只有0元, 是否立即充值\n  \n\n\n'
      find('.center').text().should.match /你的账户余额只有0元, 是否立即充值/
    .click("a:contains('立即充值')")
    .then ->
      find('.center').text().should.match /你的账户余额为1000元。/

#describe "IndexRoute", ->
  #describe "model property", ->
    #indexRoute = Intimi.IndexRoute.create()

    #it "should have the right number of items", ->
      #model = indexRoute.model()
      #model.should.have.length 3
