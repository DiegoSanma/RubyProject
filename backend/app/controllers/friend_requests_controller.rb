class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    def create
        receiver = User.find_by(id: params[:receiver_id])
        if receiver.nil?
            render json: { error: "Receiver not found." }, status: :not_found
            return
        end
        requets = FriendRequest.new(sender: @current_user, receiver: receiver, status: :pending)
        if requets.save
            render json: { message: "Friend request sent." }, status: :created
        else
            render json: { error: requets.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
    end

    def index
        received_requests = @current_user.received_friend_requests.where(status: :pending)
        render json: received_requests, status: :ok
    end

    def update
        friend_request = FriendRequest.find_by(id: params[:id], receiver: @current_user)
        if friend_request.nil?
            render json: { error: "Friend request not found." }, status: :not_found
            return
        end

        if params[:status].in?(%w[accepted declined])
            friend_request.status = params[:status]
            if friend_request.save
                render json: { message: "Friend request #{params[:status]}." }, status: :ok
            else
                render json: { error: friend_request.errors.full_messages.join(", ") }, status: :unprocessable_entity
            end
        else
            render json: { error: "Invalid status." }, status: :unprocessable_entity
        end
    end
end
