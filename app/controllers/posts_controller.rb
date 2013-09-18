class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
