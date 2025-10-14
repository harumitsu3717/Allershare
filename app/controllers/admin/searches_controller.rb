class Admin::SearchesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method)
    elsif @model == 'post'
      @records = Post.search_for(@content, @method)
    elsif @model == 'tag'
      @search_results = Tag.search_posts_for(@content, @method)
      @displayed_post_ids = []

      @records = []
      @search_results.each do |post|
        unless @displayed_post_ids.include?(post.id)
          @records << post
          @displayed_post_ids << post.id
        end
      end
    end
  end
  
end
