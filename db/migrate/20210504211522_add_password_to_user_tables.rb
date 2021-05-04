class AddPasswordToUserTables < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tables, :password_digest, :string
  end
end
