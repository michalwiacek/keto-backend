class Article < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :user

  validates :title, presence: true,
                    length: { maximum: 128 }
  validates :user_id, presence: true
  # validates :main_image, url: { allow_blank: true, schemes: %w[https http] }
  validates :main_image_background_hex_color, format: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
  validates :body_markdown, uniqueness: { scope: %i[user_id title] }

  scope :published, -> { where(published: true) }
end
