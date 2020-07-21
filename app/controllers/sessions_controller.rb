class SessionsController < ApplicationController
    def new
       @user = User.new
        
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
           sessions[:user_id] = @user.id
           redirect_to '/'
        else
         flash[:errors] = @user.errors.full_messages
           redirect_to '/login'
        end
     end
    private 
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
