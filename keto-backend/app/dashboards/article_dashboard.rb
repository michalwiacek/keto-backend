require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    description: Field::String,
    main_image: Field::Carrierwave.with_options(
      image: :standard,
      multiple: false,
      remove: false,
      remote_url: false
    ),
    main_image_background_hex_color: Field::String,
    title: Field::String,
    body_html: Field::Trix,
    body_markdown: Field::SimpleMarkdown,
    language: Field::String,
    hotness_score: Field::Number,
    edited_at: Field::DateTime,
    organic_page_views_count: Field::Number,
    organic_page_views_past_month_count: Field::Number,
    organic_page_views_past_week_count: Field::Number,
    password: Field::String,
    path: Field::String,
    archived: Field::Boolean,
    published: Field::Boolean,
    published_at: Field::DateTime,
    reading_time: Field::Number,
    show_comments: Field::Boolean,
    canonical_url: Field::String,
    ids_for_suggested_articles: Field::String,
    featured: Field::Boolean,
    slug: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    title
    published
    featured
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :description,
    :main_image,
    :main_image_background_hex_color,
    :title,
    :body_html,
    :body_markdown,
    :language,
    :hotness_score,
    :edited_at,
    :organic_page_views_count,
    :organic_page_views_past_month_count,
    :organic_page_views_past_week_count,
    :password,
    :path,
    :archived,
    :published,
    :published_at,
    :reading_time,
    :show_comments,
    :canonical_url,
    :ids_for_suggested_articles,
    :featured,
    :slug,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :description,
    :main_image,
    :main_image_background_hex_color,
    :title,
    :body_html,
    :body_markdown,
    :language,
    :hotness_score,
    :organic_page_views_count,
    :organic_page_views_past_month_count,
    :organic_page_views_past_week_count,
    :password,
    :path,
    :archived,
    :published,
    :published_at,
    :reading_time,
    :show_comments,
    :canonical_url,
    :ids_for_suggested_articles,
    :featured,
    :slug,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(article)
    "Article ##{article.id} - #{article.title}"
  end
end
