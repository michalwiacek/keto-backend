class Step < ApplicationRecord
  has_one_attached :main_image

  belongs_to :recipes
end
