class AddIdToCategoriesContact < ActiveRecord::Migration[5.1]
  def change
    add_column :categories_contacts, :id, :primary_key
  end
end
