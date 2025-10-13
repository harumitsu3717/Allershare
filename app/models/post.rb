class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

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

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tags(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
  end

end
