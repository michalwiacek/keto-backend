class CreateCategories < ActiveRecord::Migration[5.2]
  def self.up
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_reference :articles, :category
  end

  def self.down
    remove_table :categories
    remove_reference :articles, :category
  end
end
