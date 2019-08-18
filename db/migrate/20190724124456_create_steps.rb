# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.text :description
      t.belongs_to :recipes

      t.timestamps
    end
  end
end
