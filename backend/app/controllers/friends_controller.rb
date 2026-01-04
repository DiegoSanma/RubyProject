class FriendsController < ApplicationController
    def index
        friends = User.joins("INNER JOIN friend_requests ON (friend_requests.sender_id = users.id OR friend_requests.receiver_id = users.id AND friend_requests.status = #{FriendRequest.statuses[:accepted]})")
                      .where("friend_requests.status = ? AND (friend_requests.sender_id = ? OR friend_requests.receiver_id = ? AND friend_requests.status = #{FriendRequest.statuses[:accepted]})", 
                             FriendRequest.statuses[:accepted], @current_user.id, @current_user.id)
                      .where.not(id: @current_user.id)
                      .distinct
        render json: friends, status: :ok
    end
end
