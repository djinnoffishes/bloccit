class CommentsController < ApplicationController

  def new
    @post = Comment.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save!
      flash[:notice] = "Comment added."
      redirect_to topic_post_path(@comment.post.topic, @comment.post)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end
