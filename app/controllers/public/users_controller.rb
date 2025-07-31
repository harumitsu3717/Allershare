class Public::UsersController < ApplicationController
  def mypage
    @user = User.find(current_user.id)
    @posts = @user.posts.page(params[:page])
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def update
  end
end
