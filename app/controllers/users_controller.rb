class UsersController < ApplicationController

    def new
       @user = User.new(params[:id])
    end

    #def posts
     #   @user = User.find(params[:id])
      #  @posts = @user.posts
    #end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
           render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        @recipes = @user.recipes
        @comment = current_user.comments.reverse
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    

end
