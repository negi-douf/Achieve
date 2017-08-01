class RemoveConfirmableToDevise < ActiveRecord::Migration
  def up
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end

  def down
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_index :users, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.

    execute("UPDATE users SET confirmed_at = NOW()")
  end
end
