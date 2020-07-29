class CommentsController < ApplicationController
    before_action :authenticate_user!
    def new 
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(params[:content, :user_id, :post_id])
        @comment.user = current_user
        @comment.post_id = params[:post_id]
        @comment.content = params[:content]
        
        if @comment.save
            redirect_to post_path(@comment.post)
        else
            @comment.errors.full_messages.each {|msg| flash.notice = msg }
            redirect_to post_path(@comment.post)
        end
    end

    def show 
        @comment = comment.find(params[:id])
    end

    

end
