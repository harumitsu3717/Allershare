class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tags = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tags(tags)
      redirect_to mypage_users_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def favorites
    @posts = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end

end
