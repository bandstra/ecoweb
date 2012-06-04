class AddCodeToOrganisms < ActiveRecord::Migration
  def change
    add_column :organisms, :code, :integer

  end
end
