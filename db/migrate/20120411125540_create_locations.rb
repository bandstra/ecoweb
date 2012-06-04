class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string   :name
      t.text     :description
      t.integer  :image_id
      t.string   :gis

      t.timestamps
    end
  end
end
