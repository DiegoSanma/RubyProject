class UserController < ApplicationController
    def index
        users = User.all.select(:id, :name, :email)
        render json: users, status: :ok
    end

    def me
        render json: current_user
    end

    def user_relationship
        user = User.find_by(id: params[:user_id])
        if user.nil?
            render json: { error: "User not found." }, status: :not_found
            return
        end

        friendship = FriendRequest.find_by(
            "(sender_id = :current_user_id AND receiver_id = :other_user_id) OR (sender_id = :other_user_id AND receiver_id = :current_user_id)",
            current_user_id: @current_user.id,
            other_user_id: user.id
        )

        if friendship.nil?
            render json: { relationship: "none" }, status: :ok
        elsif friendship.status == "pending"
            if friendship.sender_id == @current_user.id
                render json: { relationship: "request_sent" }, status: :ok
            else
                render json: { relationship: "request_received" }, status: :ok
            end
        elsif friendship.status == "accepted"
            render json: { relationship: "friends" }, status: :ok
        else
            render json: { relationship: "none" }, status: :ok
        end
    end
end
