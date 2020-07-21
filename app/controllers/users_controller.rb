class UsersController < ApplicationController
    def index
        @users = User.find_by(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @post = @user.posts.reverse
        @recipe = @user.recipes.reverse
        @comment = @user.comments.reverse
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    

end
