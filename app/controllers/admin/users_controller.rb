class Admin::UsersController < ApplicationController

  layout 'admin'
  before_action :authenticate_admin!

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_active: !@user.is_active)
    if @user.is_active
      flash[:notice] = "ユーザーを有効にしました"
    else
      flash[:notice] = "退会処理を実行しました"
    end
    redirect_to admin_dashboards_path
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(10)
  end

end
