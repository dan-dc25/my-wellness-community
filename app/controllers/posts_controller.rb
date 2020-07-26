class PostsController < ApplicationController


    #GET /posts
    def index
        if !params[:user_id]    #check if there is a user_id. If there isn't, display all posts
            @posts = Post.all
        else                    #else display the posts associated with the user
          #binding.pry
            @user = User.find(params[:id])
            @posts = @user.posts
        end
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
       if params[:user_id] && !User.exists?(params[:user_id])
        redirect_to users_path, alert: "User not found"
       else
        @post = Post.new(user_id: params[:user_id])
       end
    end
    
   #POST /posts/new
    def create
        @post = Post.new(post_params)
        @post.user_id =  @user.id
        
        if @post.valid?
            @post.save
            current_user.posts << @post
            redirect_to user_post_path()
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
        if @post.update(post_params)
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
