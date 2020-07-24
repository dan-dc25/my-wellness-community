class SessionsController < ApplicationController
   def new
      @user = User.new
   end

   def create
      @user = User.find_by(id: params[:id])
      if @user.save
         session[:user_id] = @user.id
         redirect_to user_path
      else
         render :new
      end
    end

   def destroy 
      session.delete :user_id
      redirect_to login_path
   end

   private 
    
   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end
