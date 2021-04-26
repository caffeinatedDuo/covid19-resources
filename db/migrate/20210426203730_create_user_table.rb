class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tables do |t|
      t.string :name
      t.string :location
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
