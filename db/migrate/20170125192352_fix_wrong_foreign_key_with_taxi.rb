class FixWrongForeignKeyWithTaxi < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :taxi_id, :integer
    add_column :trips, :taxi_plate_number, :string
  end
end
