class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false, index: true
      t.references :arrival_airport, null: false, index: true
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end
  end
end
