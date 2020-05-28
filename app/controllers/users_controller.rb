class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end 

    
    def create
        user = User.create(user_params)

        if user.valid? 
            session[:user_id] = user.id 
            render json: user
          end 
    end

    def show
        user = User.where("name = ?", params[:id]).first
        if user
            session[:user_id] = user.id
            render json: user
        end
    end


    private

    def user_params
        params.require(:user).permit(:name)
    end
end
