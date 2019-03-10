class Product < ApplicationRecord
  belongs_to :user
  has_many :investments
  validates :title, :desc, presence: true
end
