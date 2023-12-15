class AddEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, default: '', null: false
    add_column :users, :encrypted_password, :string, default: '', null: false
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_index :users, :email, unique: true, name: 'index_users_on_email'
    add_index :users, :reset_password_token, unique: true, name: 'index_users_on_reset_password_token'
  end
end
