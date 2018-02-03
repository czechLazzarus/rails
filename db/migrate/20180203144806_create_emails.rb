class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :subject
      t.string :text
      t.string :plain_text
      t.string :sender
      t.integer :user_id

      t.timestamps
    end
  end
end
