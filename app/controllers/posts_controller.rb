class PostsController < ApplicationController
    #before_action :find_post, only: [:index, :show, :upadte]
    def index
        @posts = Post.find_by(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post. Post.create(post_params)
        #@post.user_id =  @user.id
        redirect_to post_path(@post.user_id)
    end

    def show
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_user
        @post = Post.find_by(params[:id])
    end
end
