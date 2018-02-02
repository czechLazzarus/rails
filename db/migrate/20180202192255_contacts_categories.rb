class ContactsCategories < ActiveRecord::Migration[5.1]
  def change
    create_join_table :contacts, :categories do |t|
      t.index [:contact_id, :category_id]
      t.index [:category_id, :contact_id]
    end
    add_foreign_key :contacts_categories, :categories
    add_foreign_key :contacts_categories, :contacts
  end
end
