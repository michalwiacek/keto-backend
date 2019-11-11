require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'articles' do
    let!(:articles) { create_pair(:article) }

    let(:query) { 'query {
        articles {
          title
        }
      }' }

    subject(:result) { KetoBackendSchema.execute(query).as_json }

    it 'returns all articles' do
      expect(result.dig('data', 'articles')).to match_array(
        articles.map { |article| ('title' == article.title) }
      )
    end
  end
end
