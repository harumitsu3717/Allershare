class Public::SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method)
    elsif @model == 'post'
      @records = Post.search_for(@content, @method)
    elsif @model == 'tag'
      @records = Post.tagged_with(@content, @method)
    end
  end

end
