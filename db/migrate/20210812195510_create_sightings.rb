class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.datetime :date
      t.string :latitude
      t.string :longtitude

      t.timestamps
    end
  end
end
