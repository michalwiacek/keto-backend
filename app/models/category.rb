class Category < ApplicationRecord
  has_many :articles

  validates :name, presence: true, length: { maximum: 128 }, uniqueness: true
end
