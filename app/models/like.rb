class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product, counter_cache: true
  validates :product_id, uniqueness: { scope: :user_id }
end