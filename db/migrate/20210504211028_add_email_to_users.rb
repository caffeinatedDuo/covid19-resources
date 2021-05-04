class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tables, :email, :string
  end
end
