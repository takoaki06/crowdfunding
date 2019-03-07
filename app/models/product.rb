class Product < ApplicationRecord
  belongs_to :user
  validates :title, :desc, presence: true
end
