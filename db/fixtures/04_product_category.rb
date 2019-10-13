Product.all.each do |product|
  ProductCategory.seed(:id,
    {
      product_id: product.id,
      category_id: Category.all.ids.sample
    }
  )
end