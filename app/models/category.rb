class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  has_many :watchings
  has_many :users, through: :watchings
end
