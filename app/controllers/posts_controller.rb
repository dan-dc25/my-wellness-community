class PostsController < ApplicationController
    before_action :authenticate_user!

    #GET /posts
    def index
          #binding.pry
          @posts = Post.all.sort_by{ |h| h.name }
    end

    #GET /posts/id
    def show
        if params[:user_id]
            @user = User.find(params[:id])
            @post = Post.find(params[:user_id])
        else
         redirect_to user_posts_path(user_id) #can't get this route to work. undefined method id for nil class(@user) or user_id for @post
        end
     end

     #GET /posts/new
    def new
        @user = User.find_by(id: params[:id])
        @post = @user.posts.build(post_params)
    end
    
   #POST /posts/new
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    #GET /posts/id/edit
    def edit
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to user_path(@user)
            else
                @post = user.posts.find_by(id: params[:id])
                redirect_to posts_path(user)
            end
        end
    end

    def update
        @post.update(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render :edit
        end
      end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to user_posts_path(@post.user_id)
    end


    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
