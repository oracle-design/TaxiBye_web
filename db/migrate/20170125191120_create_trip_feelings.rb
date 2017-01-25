class CreateTripFeelings < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_feelings do |t|
      t.string :title

      t.timestamps
    end
  end
end
