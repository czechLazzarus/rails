class CreateContactsEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts_emails do |t|
      t.integer :email_id
      t.integer :contact_id
      t.boolean :sended

      t.timestamps
    end
  end
end
