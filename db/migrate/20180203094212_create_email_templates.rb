class CreateEmailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :email_templates do |t|
      t.string :subject
      t.text :text
      t.string :sender
      t.integer :user_id

      t.timestamps
    end
  end
end
