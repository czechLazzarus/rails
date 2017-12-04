class AddUserIdToUserSmtp < ActiveRecord::Migration[5.1]
  def change
    add_column :user_smtps, :user_id, :integer
    add_index :user_smtps, :user_id
  end
end
