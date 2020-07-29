class UsersController < ApplicationController

   
    def show
        @user = User.find_by(id: params[:id])
        @posts = Post.all
        @recipes = Recipe.all
        @comment = Comment.all
    end
end
