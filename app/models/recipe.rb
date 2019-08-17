class Recipe < ApplicationRecord
  acts_as_taggable_on :tags

  has_one_attached :main_image
  has_many_attached :recipe_images

  has_many :components
  has_many :ingredients, through: :components
  has_many :steps

  validates :name, presence: true,
                   length: { maximum: 128 }
  # validates :user_id, presence: true #TODO wyłączone ze wględu na testy. naprawić testy i włączyć
  # validates :main_image, url: { allow_blank: true, schemes: %w[https http] }
  validates :main_image_background_hex_color, format: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
  validates :body_markdown, uniqueness: { scope: %i[user_id name] }

  before_save       :set_all_dates

  scope :published, -> { where(published: true, archived: false) }

  private

  def set_all_dates
    set_published_date
  end

  def set_published_date
    self.published_at = Time.current if published && published_at.blank?
  end
end
