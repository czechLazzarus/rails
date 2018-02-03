class AddUserIdToContactsEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts_emails, :user_id, :integer
  end
end
