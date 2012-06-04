class AddGroupIdToOrganisms < ActiveRecord::Migration
  def change
    add_column :organisms, :group_id, :integer

  end
end
