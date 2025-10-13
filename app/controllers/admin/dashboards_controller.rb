class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @users = User.all
    @posts = Post.all.order(created_at: :desc)
  end

end
