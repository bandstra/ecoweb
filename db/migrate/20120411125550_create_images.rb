class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   :caption
      t.text     :description
      t.integer  :user_id
      t.string   :file_name

      t.timestamps
    end
  end
end
