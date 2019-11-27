# frozen_string_literal: true

module Types
  class IngredientType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :calories, Integer, null: false
    # t.float "total_fat"
    # t.float "saturated_fat"
    # t.float "trans_fat"
    # t.float "polyunsaturated_fat"
    # t.float "monounsaturated_fat"
    # t.float "cholesterol"
    # t.float "sodium"
    # t.float "total_carbohydrates"
    # t.float "dietary_fiber"
    # t.float "sugars"
    # t.float "added_sugars"
    # t.float "sugar_alcohol"
    # t.float "protein"
    # t.float "calcium"
    # t.float "iron"
    # t.float "vitamin_d"
    # t.float "potassium"
    # t.float "vitamin_a"
    # t.float "vitamin_c"
    # t.float "vitamin_e"
    # t.float "vitamin_k"
    # t.float "vitamin_b6"
    # t.float "vitamin_b12"
    # t.float "thiamin"
    # t.float "riboflavin"
    # t.float "niacin"
    # t.float "folate"
    # t.float "folic_acid"
    # t.float "biotin"
    # t.float "pantethenic_acid"
    # t.float "phosphorus"
    # t.float "iodine"
    # t.float "magnesium"
    # t.float "zinc"
    # t.float "selenium"
    # t.float "copper"
    # t.float "manganese"
    # t.float "chromium"
    # t.float "molybdenum"
    # t.float "chloride"
  end
end
