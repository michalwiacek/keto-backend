class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :description
      t.string :main_image
      t.string :main_image_background_hex_color, default: "#dddddd"
      t.string :title
      t.text :body_html
      t.text :body_markdown
      t.string :language
      t.integer :hotness_score, default: 0
      t.datetime :edited_at
      t.integer :organic_page_views_count, default: 0
      t.integer :organic_page_views_past_month_count, default: 0
      t.integer :organic_page_views_past_week_count, default: 0
      t.string :password
      t.string :path
      t.boolean :archived, default: false
      t.boolean :published, default: false
      t.datetime :published_at
      t.integer :reading_time, default: 0
      t.boolean :show_comments, default: true
      t.string :canonical_url
      t.string :ids_for_suggested_articles, default: "[]"
      t.boolean :featured, default: false
      t.text :slug
      t.belongs_to :user

      t.timestamps
    end
  end
end
