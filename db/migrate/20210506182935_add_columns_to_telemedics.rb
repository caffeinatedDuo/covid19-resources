class AddColumnsToTelemedics < ActiveRecord::Migration[6.1]
  def change
    add_column :telemedics, :name, :string
    add_column :telemedics, :contact, :string
    add_column :telemedics, :timings, :string
    add_column :telemedics, :text_only, :string
    add_column :telemedics, :verified, :string
    add_column :telemedics, :functional, :string
    add_column :telemedics, :data_check_passed, :string
    add_column :telemedics, :location, :string
  end
end
