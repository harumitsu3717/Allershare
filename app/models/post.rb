class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :body, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(body: content)
    elsif method == 'forward'
      Post.where('body LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('body LIKE ?', '%'+content)
    elsif method == 'partical'
      Post.where('body LIKE ?', '%'+content+'%')
    end
  end


end
