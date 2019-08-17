require "administrate/base_dashboard"

class IngredientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    components: Field::HasMany,
    recipes: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    calories: Field::Number,
    total_fat: Field::Number.with_options(decimals: 2),
    saturated_fat: Field::Number.with_options(decimals: 2),
    trans_fat: Field::Number.with_options(decimals: 2),
    polyunsaturated_fat: Field::Number.with_options(decimals: 2),
    monounsaturated_fat: Field::Number.with_options(decimals: 2),
    cholesterol: Field::Number.with_options(decimals: 2),
    sodium: Field::Number.with_options(decimals: 2),
    total_carbohydrates: Field::Number.with_options(decimals: 2),
    dietary_fiber: Field::Number.with_options(decimals: 2),
    sugars: Field::Number.with_options(decimals: 2),
    added_sugars: Field::Number.with_options(decimals: 2),
    sugar_alcohol: Field::Number.with_options(decimals: 2),
    protein: Field::Number.with_options(decimals: 2),
    calcium: Field::Number.with_options(decimals: 2),
    iron: Field::Number.with_options(decimals: 2),
    vitamin_d: Field::Number.with_options(decimals: 2),
    potassium: Field::Number.with_options(decimals: 2),
    vitamin_a: Field::Number.with_options(decimals: 2),
    vitamin_c: Field::Number.with_options(decimals: 2),
    vitamin_e: Field::Number.with_options(decimals: 2),
    vitamin_k: Field::Number.with_options(decimals: 2),
    vitamin_b6: Field::Number.with_options(decimals: 2),
    vitamin_b12: Field::Number.with_options(decimals: 2),
    thiamin: Field::Number.with_options(decimals: 2),
    riboflavin: Field::Number.with_options(decimals: 2),
    niacin: Field::Number.with_options(decimals: 2),
    folate: Field::Number.with_options(decimals: 2),
    folic_acid: Field::Number.with_options(decimals: 2),
    biotin: Field::Number.with_options(decimals: 2),
    pantethenic_acid: Field::Number.with_options(decimals: 2),
    phosphorus: Field::Number.with_options(decimals: 2),
    iodine: Field::Number.with_options(decimals: 2),
    magnesium: Field::Number.with_options(decimals: 2),
    zinc: Field::Number.with_options(decimals: 2),
    selenium: Field::Number.with_options(decimals: 2),
    copper: Field::Number.with_options(decimals: 2),
    manganese: Field::Number.with_options(decimals: 2),
    chromium: Field::Number.with_options(decimals: 2),
    molybdenum: Field::Number.with_options(decimals: 2),
    chloride: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    # :components,
    # :recipes,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # :components,
    # :recipes,
    :id,
    :name,
    :calories,
    :total_fat,
    :saturated_fat,
    :trans_fat,
    :polyunsaturated_fat,
    :monounsaturated_fat,
    :cholesterol,
    :sodium,
    :total_carbohydrates,
    :dietary_fiber,
    :sugars,
    :added_sugars,
    :sugar_alcohol,
    :protein,
    :calcium,
    :iron,
    :vitamin_d,
    :potassium,
    :vitamin_a,
    :vitamin_c,
    :vitamin_e,
    :vitamin_k,
    :vitamin_b6,
    :vitamin_b12,
    :thiamin,
    :riboflavin,
    :niacin,
    :folate,
    :folic_acid,
    :biotin,
    :pantethenic_acid,
    :phosphorus,
    :iodine,
    :magnesium,
    :zinc,
    :selenium,
    :copper,
    :manganese,
    :chromium,
    :molybdenum,
    :chloride,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :components,
    # :recipes,
    :name,
    :calories,
    :total_fat,
    :saturated_fat,
    :trans_fat,
    :polyunsaturated_fat,
    :monounsaturated_fat,
    :cholesterol,
    :sodium,
    :total_carbohydrates,
    :dietary_fiber,
    :sugars,
    :added_sugars,
    :sugar_alcohol,
    :protein,
    :calcium,
    :iron,
    :vitamin_d,
    :potassium,
    :vitamin_a,
    :vitamin_c,
    :vitamin_e,
    :vitamin_k,
    :vitamin_b6,
    :vitamin_b12,
    :thiamin,
    :riboflavin,
    :niacin,
    :folate,
    :folic_acid,
    :biotin,
    :pantethenic_acid,
    :phosphorus,
    :iodine,
    :magnesium,
    :zinc,
    :selenium,
    :copper,
    :manganese,
    :chromium,
    :molybdenum,
    :chloride,
  ].freeze

  # Overwrite this method to customize how ingredients are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ingredient)
  #   "Ingredient ##{ingredient.id}"
  # end
end
