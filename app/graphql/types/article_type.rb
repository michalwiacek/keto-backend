module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :body_markdown, String, null: false
    field :reading_time, String, null: false
    field :published, Boolean, null: false
    field :published_at, String, null: true
    field :main_image_url, String, null: true, extensions: [ImageUrlField]
    field :article_images_urls, [String], null: true
    field :user, Types::UserType, null: false

    def article_images_urls
      AssociationLoader.for(
        object.class,
        article_images_attachments: :blob
      ).load(object).then do |article_images|
        article_images.map { |image|
          Rails
            .application
            .routes
            .url_helpers.rails_blob_url(image)
        }
      end
    end
  end
end
