class Ingredient < ApplicationRecord
  has_one_attached :main_image

  has_many :components
  has_many :recipes, through: :components
end
