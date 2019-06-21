require 'rails_helper'

RSpec.describe Article, type: :model do

  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  let(:article) { build(:article) }

  describe "ActiveModel validations" do
    it { expect(article).to validate_presence_of(:title) }
  end
end
