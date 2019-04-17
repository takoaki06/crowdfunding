class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  
  attr_accessor :current_password

  has_many :products
  has_many :investments
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
  
  enum role: [:general, :administer]

end
