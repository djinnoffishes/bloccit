class UsersController < ApplicationController

  def show
    @posts = @user.posts.visible_to(current_user)
    @user = User.find(params[:id])  
  end

end