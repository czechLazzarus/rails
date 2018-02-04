class AddErrorToContactsEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts_emails, :error, :boolean
  end
end
