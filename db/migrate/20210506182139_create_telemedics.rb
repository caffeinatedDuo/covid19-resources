class CreateTelemedics < ActiveRecord::Migration[6.1]
  def change
    create_table :telemedics do |t|

      t.timestamps
    end
  end
end
