class RemoveGroupIdFromSightings < ActiveRecord::Migration
  def up
    remove_column :sightings, :group_id
      end

  def down
    add_column :sightings, :group_id, :integer
  end
end
