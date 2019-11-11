# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :avatar_url, String, null: true
    field :name, String, null: false
    field :email, String, null: false
    field :articles, [Types::ArticleType], null: true
    field :articles_count, Integer, null: true

    def articles_count
      object.articles.size
    end

    def avatar_url
      AssociationLoader.for(object.class, avatar_attachment: :blob).load(object)
        .then do |avatar|
        Rails.application.routes.url_helpers.rails_blob_url(avatar)
      end
    end
  end
end
