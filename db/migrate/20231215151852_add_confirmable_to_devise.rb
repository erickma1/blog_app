class AddConfirmableToDevise < ActiveRecord::Migration[7.0]
  def up
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
