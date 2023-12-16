class AddIndexPosts < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :author_id, name: 'index_posts_on_author_id'
    add_foreign_key :posts, :users, column: :author_id
  end
end
