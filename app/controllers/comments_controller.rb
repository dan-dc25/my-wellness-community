class CommentsController < ApplicationController
    def create
        comment = Comment.new
        comment.user = current_user
        comment.post_id = params[:post_id]
        comment.content = params[:content]
        
        if comment.save
            redirect_to post_path(comment.post)
        else
            comment.errors.full_messages.each {|msg| flash.notice = msg }
            redirect_to post_path(comment.post)
        end
    end
end
