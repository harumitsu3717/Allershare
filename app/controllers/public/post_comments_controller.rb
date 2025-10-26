class Public::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      @error_comment = comment
      @post = Post.find(params[:post_id])
      @post_comment = PostComment.new
      render 'public/posts/show'
    end
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    if post_comment.user.id == current_user.id
      post_comment.destroy
    end
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
