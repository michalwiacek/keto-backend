class Recipe < ApplicationRecord
  acts_as_taggable_on :tags

  has_one_attached :main_image
  has_many_attached :recipe_images
  
  has_many :components
  has_many :ingredients, through: :components
  has_many :steps
end
