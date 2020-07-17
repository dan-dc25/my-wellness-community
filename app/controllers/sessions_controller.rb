class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_or_create(user_params)
        redirect_to user_path
    end

    private 
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
