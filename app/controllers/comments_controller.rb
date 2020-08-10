class CommentsController < ApplicationController

    def index
        @comments = @post.comments.all
    end
    
    def create
        #@comment = Comment.new(comment_params)
        #@post = Post.find_by(id: params[:id])
        #@comment.post_id = params[:post_id]
        #@comment.save
        @comment = Comment.create(comment_params)
        @comment.user_name = current_user
        if @comment.save
            redirect_to post_path(@comment.post)
        else
            flash.now[:danger] = "error"
        end
    end
        #@post = Post.find_by(id: params[:post_id])
        
        #@user = @comment.user
        #redirect_to post_path(@post) 


    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:post_id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    private

    def comment_params
        params.require(:comment).permit(:user_name, :content, :post_id)
    end

end
