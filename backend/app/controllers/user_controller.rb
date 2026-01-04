class UserController < ApplicationController
    def index
        users = User.all.select(:id, :name, :email)
        render json: users, status: :ok
    end

    def me
        render json: current_user
    end
end
