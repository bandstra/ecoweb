class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :firstname
      t.string   :lastname
      t.text     :profile
      t.integer  :image_id
      t.string   :email
      t.string   :password
      t.integer  :role_id

      t.timestamps
    end
  end
end
