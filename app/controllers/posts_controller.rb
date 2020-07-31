class PostsController < ApplicationController
    before_action :authenticate_user!

    #GET /posts
    def index
        @posts = Post.all.order("created_at DESC")
        #@posts = current_user.posts.all
    end

     #GET /posts/new
    def new
        @post = Post.new
        @comment = Comment.new(post_id: params[:post_id])
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

     #GET /posts/id
     def show
        @user = User.find_by(id: params[:id])
        @post = Post.find_by(id: params[:id])
        @comment = Comment.new
            #redirect_to post_path
     end

    #GET /posts/id/edit
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to action: :index
            flash[:notice] = 'post was updated.'
        else
            render 'edit'
        end
    end    
   

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path(@post)
    end


    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
