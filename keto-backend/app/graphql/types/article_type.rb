module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :body_markdown, String, null: false
    field :reading_time, String, null: false
    field :published, Boolean, null: false
    field :published_at, String, null: true
    field :main_image_url, String, null: true
    # TODO bring the idea of variants
    # field :main_image_url, String, null: true, extensions: [ImageUrlField]
    field :user, Types::UserType, null: false

    def main_image_url
      AssociationLoader.for(
        object.class,
        main_image_attachment: :blob
      ).load(object).then do |main_image|
        # next if main_image.nil?
        # main_image = main_image.variant(variant) if variant
        Rails.application.routes.url_helpers.rails_blob_url(main_image)
      end
    end
  end
end
