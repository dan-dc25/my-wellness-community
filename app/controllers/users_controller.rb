class UsersController < ApplicationController

   
    def show
        @user = User.find_by(id: params[:id])
        @posts = @user.posts.all
        @recipes = @user.recipes.all
    end
end
