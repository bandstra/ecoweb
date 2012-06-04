class CreateOrganisms < ActiveRecord::Migration
  def change
    create_table :organisms do |t|
      t.integer  :image_id
      t.string   :common_name
      t.string   :binominal_name
      t.string   :family
      t.string   :wikipedia_entry

      t.timestamps
    end
  end
end
