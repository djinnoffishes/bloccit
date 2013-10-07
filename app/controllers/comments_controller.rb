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
      redirect_to topic_post_path(@comment.post.topic, @comment.post)
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    authorize! :destroy, @comment, message: "You need to own the comment to delete it."
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end
