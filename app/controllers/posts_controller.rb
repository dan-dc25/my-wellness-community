class PostsController < ApplicationController
    before_action :find_post, only: [:index, :show, :upadte]
    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id =  current_user.id
        if @post.valid?
            @post.save
            redirect_to user_post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
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
