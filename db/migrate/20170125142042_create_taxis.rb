class CreateTaxis < ActiveRecord::Migration[5.0]
  def change
    create_table :taxis, primary_key: 'plate_number', id: false do |t|
      t.string :plate_number, index: { unique: true}, null: false
      t.string :driver, default: ''
      t.decimal :avg_rating, default: 0, precision: 3, scale: 1

      t.timestamps
    end
  end
end
