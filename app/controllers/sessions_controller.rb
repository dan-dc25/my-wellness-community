class SessionsController < ApplicationController
   def new
      @user = User.new
   end

   def create
      @user = User.find_by(username: params[:username])
      return head(:forbidden) unless @user.authenticate(params[:password])
      if @user
         redirect_to user_path(@user)
      else
         flash[:errors] = @user.errors.full_messages
         render :login
      end
    end

   def destroy 
      session.delete :username
   end

   private 
    
   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end
