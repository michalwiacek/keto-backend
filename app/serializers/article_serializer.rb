# frozen_string_literal: true

class ArticleSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :body_html, :body_markdown,
             :tag_list

  belongs_to :user
end
