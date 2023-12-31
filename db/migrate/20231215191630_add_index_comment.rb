class AddIndexComment < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, :author_id, name: 'index_comments_on_author_id'
    add_index :comments, :post_id, name: 'index_comments_on_post_id'
    add_foreign_key :comments, :posts
    add_foreign_key :comments, :users, column: :author_id
  end
end
