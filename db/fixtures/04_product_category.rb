product_ids = [*1..20]
category_ids = [2,5,3,2,3,4,5,1,1,2,4,3,1,3,2,4,3,4,5,1]

20.times do |index|
  ProductCategory.seed(:id,
    {
      product_id: product_ids[index],
      category_id: category_ids[index]
    }
  )
end