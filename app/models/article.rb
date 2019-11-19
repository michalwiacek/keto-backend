# frozen_string_literal: true
require 'uploads'

class Article < ApplicationRecord
  acts_as_taggable_on :tags

  has_one_attached :main_image
  has_many_attached :article_images

  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 128 }
  # validates :user_id, presence: true #TODO wyłączone ze wględu na testy. naprawić testy i włączyć
  # validates :main_image, url: { allow_blank: true, schemes: %w[https http] }
  validates :main_image_background_hex_color,
            format: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
  validates :body_markdown, uniqueness: { scope: %i[user_id title] }

  before_validation :create_slug
  before_save :set_all_dates

  scope :published, -> { where(published: true, archived: false) }
  scope :after_publication, -> { published.where('published_at <= ?', DateTime.current) }
  scope :featured, -> { where(featured: true) }

  def main_image_header_variant
    variation =
      ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 600, height: 600, blob: main_image.blob))
    ActiveStorage::Variant.new(main_image.blob, variation)
  end

  private

  def title_to_slug
    title.to_s.downcase.parameterize.tr('_', '') + '-' + rand(100_000).to_s(26)
  end

  def create_slug
    if slug.blank? && title.present? && !published
      self.slug = title_to_slug + "-temp-slug-#{rand(10_000_000)}"
    elsif should_generate_final_slug?
      self.slug = title_to_slug
    end
  end

  def should_generate_final_slug?
    (title && published && slug.blank?) ||
      (title && published && slug.include?('-temp-slug-'))
  end

  def set_all_dates
    set_published_date
  end

  def set_published_date
    self.published_at = Time.current if published && published_at.blank?
  end
end
