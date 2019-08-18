# frozen_string_literal: true

class AddNameToUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :first_name, :string, null: false, default: "John"
    add_column :users, :last_name, :string, null: false, default: "Doe"
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
