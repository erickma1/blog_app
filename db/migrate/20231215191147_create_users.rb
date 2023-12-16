class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter, default: 0
      t.timestamps null: false
      t.string :email, default: "", null: false
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :role
      t.index :email, unique: true, name: 'index_users_on_email'
      t.index :reset_password_token, unique: true, name: 'index_users_on_reset_password_token'
    end
  end
end
