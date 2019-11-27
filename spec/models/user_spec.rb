require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'ActiveModel validations' do
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:password) }
    it do
      expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity
    end
    it { expect(user).to allow_value('dhh@nonopinionated.com').for(:email) }
    it { expect(user).to_not allow_value('base@example').for(:email) }
    it { expect(user).to_not allow_value('blah').for(:email) }
  end

  describe 'ActiveRecord associations' do
    it { expect(user).to have_many(:articles) }
  end
end
