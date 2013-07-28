describe "Index page", ->
  it "displays a welcome message", ->
    visit('/').then ->
      find('.logo').text().should.equal 'Intimi'

#describe "IndexRoute", ->
  #describe "model property", ->
    #indexRoute = Intimi.IndexRoute.create()

    #it "should have the right number of items", ->
      #model = indexRoute.model()
      #model.should.have.length 3
