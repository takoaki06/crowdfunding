class Message < ApplicationRecord
  validates :comment, presence: true
  belongs_to :message_group
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  scope :newer, -> { order(id: :desc) }
end
