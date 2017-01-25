class AddTripFeelingIdToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :trip_feeling_id, :integer
  end
end
