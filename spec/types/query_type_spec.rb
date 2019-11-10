require "rails_helper"

RSpec.describe Types::QueryType do
  describe "articles" do
    let!(:articles) { create_pair(:article) }

    let(:query) do
      %(query {
        articles {
          title
        }
      })
    end

    subject(:result) do
      KetoBackendSchema.execute(query).as_json
    end

    it "returns all articles" do
      expect(result.dig("data", "articles")).to match_array(
        articles.map { |article| ( "title" == article.title ) }
      )
    end
  end
end