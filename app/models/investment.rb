class Investment < ApplicationRecord
  validates :user_id, uniqueness: { scope: :product_id }
  validates :price, presence: true, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :product

  #目標額と出資額の合計の判別
  def self.investable?(product)
    investment_sum_price = product.investments.sum(:price)
    product.price > investment_sum_price
  end

  #目標額と出資額の判別
  def exceed?(product)
    product.price >= self.price
  end
end