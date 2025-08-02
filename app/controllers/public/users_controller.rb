class Public::UsersController < ApplicationController
  def mypage
    @user = User.find(current_user.id)
    @posts = @user.posts.page(params[:page])
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to mypage_path
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to mypage_path
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end