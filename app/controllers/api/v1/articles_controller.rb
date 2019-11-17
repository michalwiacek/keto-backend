# frozen_string_literal: true

class Api::V1::ArticlesController < Api::V1::ApplicationController
  expose :articles, -> { Article.all }
  expose :article
  before_action :authorize_article, except: %i[show index]

  def index
    json_response(obj: ArticleSerializer.new(articles))
  end

  def show
    json_response(obj: ArticleSerializer.new(article))
  end

  def create
    json_response(status: :created, obj: ArticleSerializer.new(article)) if article.save!
  end

  def update
    json_response(status: :ok, obj: ArticleSerializer.new(article)) if article.update!(article_params)
  end

  def destroy
    article.destroy ? json_response(status: :ok) : json_response(status: :unprocessable_entity)
  end

  private

  def authorize_article
    authorize article
  end

  def article_params
    params.require(:article).permit(:title)
  end
end
