class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.string :route
      t.references :taxi, foreign_key: true
      t.text :message, default: ''

      t.timestamps
    end
  end
end
