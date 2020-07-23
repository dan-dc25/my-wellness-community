class PostsController < ApplicationController
  before_action :require_login

    def index
       @posts = current_user.posts.all
    end

    def new
        @post = Post.new(user_id: params[:user_id])
    end
   
    def create
        @post = Post.new(post_params)
        @post.user_id =  current_user.id
        if @post.valid?
            @post.save
            current_user.posts << @post
            redirect_to user_post_path(@post.user_id, current_user.id)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
       @post = Post.find_by(id: params[:id])
       if @post
        @user = User.find(@post.user_id)
       else
        redirect_to user_post_path(@post.user_id, current_user.id)
       end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
      end



    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
