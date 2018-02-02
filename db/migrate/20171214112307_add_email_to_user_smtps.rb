class AddEmailToUserSmtps < ActiveRecord::Migration[5.1]
  def change
    add_column :user_smtps, :email, :string
  end
end
