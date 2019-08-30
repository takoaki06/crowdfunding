ids = [*1..10]
user_ids = [1,2]
price = [1000,2000,10000,50000]


10.times do |index|
  Product.seed(:id,
    {
      title: "testproduct#{ids[index]}",
      desc: "testproduct#{ids[index]}です。",
      user_id: user_ids.sample,
      price: price.sample
    }
  )
end
