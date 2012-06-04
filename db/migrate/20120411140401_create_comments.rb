class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer  :user_id
      t.integer  :image_id
      t.integer  :sighting_id
      t.text     :note

      t.timestamps
    end
  end
end
