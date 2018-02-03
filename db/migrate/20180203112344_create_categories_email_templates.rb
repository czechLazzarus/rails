class CreateCategoriesEmailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_email_templates do |t|
      t.integer :email_template_id
      t.integer :category_id

      t.timestamps
    end
  end
end
