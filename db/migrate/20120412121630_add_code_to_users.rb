class AddCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :code, :integer

  end
end
