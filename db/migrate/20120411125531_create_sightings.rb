class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.integer  :tag
      t.integer  :organism_id
      t.float    :length
      t.float    :weight
      t.boolean  :parasite
      t.integer  :location_id
      t.date     :date
      t.text     :note
      t.integer  :user_id
      t.integer  :image_id

      t.timestamps
    end
  end
end
