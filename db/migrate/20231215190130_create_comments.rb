class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.bigint :author_id, null: false
      t.bigint :post_id, null: false
      t.timestamps null: false
    end
end
end
