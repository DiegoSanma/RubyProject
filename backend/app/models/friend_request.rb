class FriendRequest < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2 }

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :sender_id, uniqueness: { scope: :receiver_id, message: "Friend request already sent." }
end
