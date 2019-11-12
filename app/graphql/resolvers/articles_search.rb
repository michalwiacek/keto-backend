# frozen_string_literal: true

require 'search_object/plugin/graphql'

class Resolvers::ArticlesSearch
  include SearchObject.module(:graphql)

  scope { Article.after_publication }

  type types[Types::ArticleType]

  class ArticleFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :title_contains, String, required: false
    argument :category_contains, String, required: false
  end

  class LinkOrderBy < ::Types::BaseEnum
    value 'createdAt_ASC'
    value 'createdAt_DESC'
  end

  option :filter, type: ArticleFilter, with: :apply_filter
  option :first, type: types.Int, with: :apply_first
  option :skip, type: types.Int, with: :apply_skip
  option :orderBy, type: LinkOrderBy, default: 'createdAt_DESC'

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Article.after_publication
    scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value [:title_contains] 
    scope = scope.where('category.name LIKE ?', "%#{value[:category_contains]}%") if value [:category_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_skip(scope, value)
    scope.offset(value)
  end

  def apply_orderBy_with_created_at_asc(scope) # rubocop:disable Style/MethodName
    scope.order('created_at ASC')
  end

  def apply_orderBy_with_created_at_desc(scope) # rubocop:disable Style/MethodName
    scope.order('created_at DESC')
  end

  # def fetch_results
  #   # NOTE: Don't run QueryResolver during tests
  #   return super unless context.present?

  #   GraphQL::QueryResolver.run(Article, context, Types::ArticleType) do
  #     super
  #   end
  # end
end
