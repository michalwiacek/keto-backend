class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :body_markdown
      t.integer :cooking_time, default: 0
      t.boolean :archived, default: false
      t.boolean :published, default: false
      t.datetime :published_at
      t.boolean :show_comments, default: true
      t.boolean :featured, default: false
      t.datetime :edited_at
      t.integer :organic_page_views_count, default: 0
      t.integer :organic_page_views_past_month_count, default: 0
      t.integer :organic_page_views_past_week_count, default: 0
      t.string :language
      t.integer :hotness_score, default: 0
      t.text :slug
      t.belongs_to :user

      t.timestamps
    end
  end
end
