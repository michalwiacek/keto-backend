
class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :admin, :boolean, null: false, default: false
  end

  def self.down
    remove_column :users, :admin
  end
end
