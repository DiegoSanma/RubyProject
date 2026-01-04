# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 13 }
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id', dependent: :destroy
end

