# frozen_string_literal: true

class CreateJwtBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :jwt_blacklist do |t|
      t.string :jti, null: false
      t.datetime :exp
    end
    add_index :jwt_blacklist, :jti
  end
end
