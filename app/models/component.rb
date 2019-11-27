# frozen_string_literal: true

class Component < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
end
