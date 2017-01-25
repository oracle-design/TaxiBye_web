class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.decimal :score
      t.text :message
      t.references :trip, foreign_key: true

      t.timestamps
    end

    remove_column :trips, :message, :text, default: ''
  end
end
