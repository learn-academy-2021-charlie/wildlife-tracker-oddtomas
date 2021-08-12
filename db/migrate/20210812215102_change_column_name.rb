class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change

    rename_column :sightings, :longtitude, :longitude
  end
end
