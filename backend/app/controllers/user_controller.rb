class UserController < ApplicationController
    def index
        users = User.all.select(:id, :name, :email)
        render json: users, status: :ok
    end
end
