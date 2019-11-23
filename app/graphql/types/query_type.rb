# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :articles, [Types::ArticleType], null: false do
      argument :tags, [String], required: false
    end

    def articles(**args)
      if args[:tags]
        Article.after_publication
          .tagged_with(args[:tags])
          .limit(10)
          .preload(:user)
      elsif args[:category]
        Article.after_publication
          .with_category(args[:category])
          .limit(10)
          .preload(:user)
      else
        Article.after_publication.not_featured
          .limit(10)
          .preload(:user)
      end
    end

    field :search_articles, function: Resolvers::ArticlesSearch

    def last_featured_article
      Article.after_publication.featured.last.preload(:user)
    end

    def featured_articles
      Article.after_publication.featured.preload(:user)
    end

    field :featured_articles, [Types::ArticleType], null: false

    field :last_featured_article, Types::ArticleType, null: false

    field :recipes, [Types::RecipeType], null: false

    field :ingredients, [Types::IngredientType], null: false
    def ingredients
      Ingredient.all.limit(15)
    end

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

    field :category, Types::CategoryType, null: false do
      argument :id, ID, required: true
    end

    field :ingredient, Types::IngredientType, null: false do
      argument :id, ID, required: true
    end

    def ingredient(id:)
      Ingredient.find(id)
    end

    def category(id:)
      Category.fidn(id)
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
