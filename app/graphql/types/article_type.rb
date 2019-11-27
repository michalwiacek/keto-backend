# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    graphql_name "Article"
    description "An article"

    implements GraphQL::Relay::Node.interface

    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :tags, [String], null: false
    field :body_markdown, String, null: false
    field :reading_time, String, null: false
    field :featured, Boolean, null: false
    field :published, Boolean, null: false
    field :published_at, String, null: true
    field :main_image_url, String, null: true, extensions: [ImageUrlField]
    field :main_image_thumbnail_url, String, null: true
    field :article_images_urls, [String], null: true
    field :ids_for_suggested_articles, [String], null: true
    field :show_comments, Boolean, null: false
    field :slug, String, null: true
    field :main_image_background_hex_color, String, null: true
    field :user, Types::UserType, null: false
    field :category, Types::CategoryType, null: false

    def main_image_thumbnail_url
      AssociationLoader.for(object.class, main_image_attachment: :blob).load(object).then do |image|
        image = image.variant(resize: '300x300')
        Rails.application.routes.url_helpers.url_for(image)
      end
    end

    def article_images_urls
      AssociationLoader.for(object.class, article_images_attachments: :blob)
        .load(object)
        .then do |article_images|
        article_images.map do |image|
          image = image.variant(resize: '700x700')
          Rails.application.routes.url_helpers.rails_blob_url(image)
        end
      end
    end
  end
end
