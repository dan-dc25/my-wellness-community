class UsersController < ApplicationController

   
    def show
        @user = User.find_by(id: params[:user_id])
        @posts = @user.posts.reverse
        @recipes = @user.recipes
        @comment = current_user.comments.reverse
    end
end
