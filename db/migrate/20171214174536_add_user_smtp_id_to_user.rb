class AddUserSmtpIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_smtp_id, :integer
    add_index :users, :user_smtp_id
  end
end
