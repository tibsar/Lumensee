class CreateOrbitLocations < ActiveRecord::Migration
  def change
    create_table :orbit_locations do |t|

      t.timestamps null: false
    end
  end
end
