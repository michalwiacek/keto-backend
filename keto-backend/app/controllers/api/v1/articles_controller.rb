class Api::V1::ArticlesController < Api::V1::ApplicationController
  expose :articles, -> { Article.all }
  expose :article
  before_action :authorize_article, except: %i[show index]

  def index
    render_response(status: :ok, obj: ArticleSerializer.new(articles))
  end

  def show
    render_response(status: :ok, obj: ArticleSerializer.new(article))
  end

  def create
    render_response(status: :ok, obj: ArticleSerializer.new(article)) if article.save!
  end

  def update
    render_response(status: :ok, obj: ArticleSerializer.new(article)) if article.update!(article_params)
  end

  def destroy
    if article.destroy
      render_response(status: :ok)
    else
      render_response(status: :unprocessable_entity)
    end
  end

  private

  def authorize_article
    authorize article
  end

  def article_params
    params.require(:article).permit(:title)
  end
end
