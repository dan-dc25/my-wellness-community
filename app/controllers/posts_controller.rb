class PostsController < ApplicationController


    #GET /posts
    def index
        if !params[:user_id]    #check if there is a user_id. If there isn't, display all posts
            @posts = Post.all
        else                    #else display the posts associated with the user
          #binding.pry
            @user = User.find_by(id: params[:user_id])
            @posts = @user.posts.all
        end
    end

    #GET /posts/id
    def show
        if params[:user_id]
         @user = User.find_by(id: params[:user_id])
    
        else
         redirect_to user_posts_path(@post.id) #can't get this route to work. undefined method id for nil class(@user) or user_id for @post
        end
     end

     #GET /posts/new
    def new
       @user = User.find(params[:user_id])
       @post = @user.posts.build
    end
    
   #POST /posts/new
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

    #GET /posts/id/edit
    def edit
        @user = User.find(params[:user_id])
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
