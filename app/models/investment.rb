class Investment < ApplicationRecord
  validates :user_id, uniqueness: { scope: :product_id }
  validates :price, presence: true, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :product
end
