# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :articles, [Types::ArticleType], null: false do
      argument :tags, [String], required: false
    end

    def articles(**args)
      if args[:tags]
        Article.published.where('published_at <= ?', DateTime.current).tagged_with(args[:tags]).limit(10).preload(:user)
      else
        Article.published.where('published_at <= ?', DateTime.current).limit(10).preload(:user)
      end
    end

    field :recipes, [Types::RecipeType], null: false

    def recipes
      Recipe.published.where('published_at <= ?', DateTime.current).limit(10)
    end

    field :article, Types::ArticleType, null: false do
      argument :id, ID, required: true
    end

    field :recipe, Types::RecipeType, null: false do
      argument :id, ID, required: true
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    def article(id:)
      Article.find(id)
    end

    def recipe(id:)
      Recipe.find(id)
    end
  end
end
