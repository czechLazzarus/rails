class CreateUserSmtps < ActiveRecord::Migration[5.1]
  def change
    create_table :user_smtps do |t|
      t.string :username
      t.string :smtp
      t.integer :port
      t.string :protocol, limit: 10
      t.string :password

      t.timestamps
    end
  end
end
