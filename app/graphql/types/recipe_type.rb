# frozen_string_literal: true

module Types
  class RecipeType < Types::BaseObject
    graphql_name "Recipe"
    description "A recipe"

    implements GraphQL::Relay::Node.interface

    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :body_markdown, String, null: false
    field :cooking_time, String, null: false
    field :difficulty, String, null: false
    field :published, Boolean, null: false
    field :published_at, String, null: true
    field :main_image_url, String, null: true, extensions: [ImageUrlField]
    field :recipe_images_urls, String, null: true
    field :user, Types::UserType, null: false

    def recipe_images_urls
      AssociationLoader.for(object.class, recipe_images_attachments: :blob)
        .load(object)
        .then do |recipe_images|
        recipe_images.map do |image|
          Rails.application.routes.url_helpers.rails_blob_url(image)
        end
      end
    end
  end
end
