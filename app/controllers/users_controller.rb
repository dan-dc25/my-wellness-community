class UsersController < ApplicationController

    def new
       @user = User.new
    end


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
        @user = User.find_by(id: session[:user_id])
        @posts = Post.all.select { |p| p.user_id == current_user.id}
        @recipes = Recipe.all.select { |r| r.user_id == current_user.id}
        @comment = current_user.comments.reverse
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    

end
