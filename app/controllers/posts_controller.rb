class PostsController < ApplicationController
  
    def index
        if params[:user_id]
            @posts = User.find(params[:user_id]).posts
        else
            @posts = Post.all
        end
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to posts_path
        else
            @post = Post.new(user_id: params[:user_id])
        end
    end
   
    def create
        @post = Post.new(post_params)
        @post.user_id =  current_user.id
        if @post.valid?
            @post.save
            current_user.posts << @post
            redirect_to user_post_path(:user_id, :post_id)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_user_post_path(:user_id, :post_id)
        end
    end

    def show
       @post = Post.find_by(id: params[:id])
       if @post
        @user = User.find(@post.user_id)
       else
        redirect_to user_posts_path(:user_id, :post_id)
       end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
