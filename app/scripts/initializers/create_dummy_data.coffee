Intimi.initializer
  name: 'createDummyData'
  initialize: (container, application) ->
    Intimi.User.find(name: 'intimi').then (users) ->
      return unless users.get('length') == 0

      user = Intimi.User.createRecord
               email: 'intimi@example.com'
               name: 'intimi'
               password: '123456'
               realname: 'Intimi'
               roles: 'admin'
      user.save()

    Intimi.PrepaidCard.find().then (cards) ->
      return unless cards.get('length') == 0

      for price in [10, 50, 100, 300, 500, 1000]
        Intimi.PrepaidCard.createRecord
          price: price

    #Intimi.Contact.find().then (contacts) ->
      #if contacts.get('length') == 0
        #[1..20].map (i) ->
          #message = Intimi.Message.createRecord
            #content: Faker.Lorem.sentence(),
            #direction: 'out',
            #status: 'sent',
            #survey: (Math.random() > 0.5),
            #sender: Intimi.Sender.find(1),
            #receiver: Intimi.Receiver.find(1)

          #Intimi.Contact.createRecord
            #user: Intimi.User.find(1),
            #name: Faker.Name.findName(),
            #number: Faker.PhoneNumber.phoneNumber(),
            #notRepliedCount: Faker.random.number(10),
            #messagesCount: Faker.random.number(10),
            #latestMessage: message
