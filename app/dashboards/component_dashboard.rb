# frozen_string_literal: true

require "administrate/base_dashboard"

class ComponentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    recipe: Field::BelongsTo,
    ingredient: Field::BelongsTo,
    id: Field::Number,
    type: Field::Number,
    quantity: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :recipe,
    :ingredient,
    :id,
    :type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :recipe,
    :ingredient,
    :id,
    :type,
    :quantity,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :recipe,
    :ingredient,
    :type,
    :quantity,
  ].freeze

  # Overwrite this method to customize how components are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(component)
  #   "Component ##{component.id}"
  # end
end
