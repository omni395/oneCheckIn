class CreateAircrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :aircrafts do |t|
      t.string :name
      t.text :description
      t.string :www
      t.string :iata
      t.string :icao
      t.string :checkin_link
      t.string :manage_booking
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
