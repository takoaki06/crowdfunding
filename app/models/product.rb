class Product < ApplicationRecord
  validates :title, :desc, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  belongs_to :user
  has_many :investments
end
