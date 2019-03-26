class Product < ApplicationRecord
  validates :title, :desc, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  belongs_to :user
  has_many :investments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def already_liked?(user)
    self.likes.exists?(user_id: user.id) #likeモデルの中にuser_idがあるかの判別
  end

end
