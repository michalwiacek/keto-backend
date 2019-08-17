module Types
  class QueryType < Types::BaseObject
    field :articles, [Types::ArticleType], null: false

    def articles
      Article.published.where('published_at <= ?', DateTime.now)
    end

    field :recipes, [Types::RecipeType], null: false

    def recipes
      Recipe.published.where('published_at <= ?', DateTime.now)
    end

    field :article, Types::ArticleType, null: false do
      argument :id, ID, required: true
    end

    field :recipe, Types::RecipeType, null: false do
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end

    def recipe(id:)
      Recipe.find(id)
    end
  end
end
