class AddPostIdToPostTags < ActiveRecord::Migration[6.1]
  def change
    add_column :post_tags, :post_id, :integer
  end
end
