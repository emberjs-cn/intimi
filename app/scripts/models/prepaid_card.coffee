Intimi.PrepaidCard = DS.Model.extend
  price: DS.attr('number')
  url:(->
    "https://mapi.alipay.com/gateway.do?service=trade_create_by_buyer&_input_charset=utf-8&partner=2088302884967445&seller_email=123924971%40qq.com&payment_type=1&out_trade_no=20130806200116&subject=%E6%B5%8B%E8%AF%95%E5%85%85%E5%80%BC&logistics_type=POST&logistics_fee=0&logistics_payment=BUYER_PAY&price=0.01&quantity=1&return_url=http%3A%2F%2Flocalhost%3A9000&sign_type=MD5&sign=3c9888857d8d46536aac5fc1bab6797f"
  ).property()
