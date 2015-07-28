class CreateStarApis < ActiveRecord::Migration
  def change
    create_table :star_apis do |t|

      t.timestamps null: false
    end
  end
end
