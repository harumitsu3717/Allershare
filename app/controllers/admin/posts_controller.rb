class Admin::PostsController < ApplicationController

  layout 'admin'
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_dashboards_path
  end
  
end
