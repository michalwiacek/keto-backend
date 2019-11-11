# frozen_string_literal: true

require 'administrate/base_dashboard'

class RecipeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    components: Field::HasMany,
    ingredients: Field::HasMany,
    steps: Field::HasMany,
    id: Field::Number,
    tags: Field::ActsAsTaggable,
    recipe_images:
      Field::ActiveStorage.with_options(
        direct_upload: true, show_in_index: true, show_preview_size: '150x200'
      ),
    main_image:
      Field::ActiveStorage.with_options(
        direct_upload: true, show_in_index: true, show_preview_size: '150x200'
      ),
    name: Field::String,
    description: Field::Text,
    body_markdown: Field::SimpleMarkdown,
    cooking_time: Field::Number,
    difficulty: Field::Number,
    archived: Field::Boolean,
    published: Field::Boolean,
    published_at: Field::DateTime,
    show_comments: Field::Boolean,
    featured: Field::Boolean,
    edited_at: Field::DateTime,
    organic_page_views_count: Field::Number,
    organic_page_views_past_month_count: Field::Number,
    organic_page_views_past_week_count: Field::Number,
    language: Field::String,
    hotness_score: Field::Number,
    slug: Field::Text,
    user: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[name tags id].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    components
    ingredients
    steps
    id
    name
    description
    main_image
    recipe_image
    body_markdown
    cooking_time
    difficulty
    archived
    published
    published_at
    show_comments
    featured
    edited_at
    organic_page_views_count
    organic_page_views_past_month_count
    organic_page_views_past_week_count
    language
    hotness_score
    slug
    user
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    components
    ingredients
    steps
    name
    tags
    main_image
    recipe_images
    description
    body_markdown
    cooking_time
    difficulty
    archived
    published
    published_at
    show_comments
    featured
    edited_at
    organic_page_views_count
    organic_page_views_past_month_count
    organic_page_views_past_week_count
    language
    hotness_score
    slug
    user
  ].freeze

  # Overwrite this method to customize how recipes are displayed
  # across all pages of the admin dashboard.

  def display_resource(recipe)
    "Recipe ##{recipe.id} - #{recipe.name}"
  end

  def permitted_attributes
    super + [recipe_images: []]
  end
end
