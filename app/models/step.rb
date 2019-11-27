# frozen_string_literal: true

class Step < ApplicationRecord
  has_one_attached :main_image

  belongs_to :recipes
end
