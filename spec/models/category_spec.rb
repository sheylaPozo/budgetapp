require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    let(:category) { create(:category) }
    it 'name should be present' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'email should be present' do
      category.icon = nil
      expect(category).to_not be_valid
    end

    it 'owner should be present' do
      category.user = nil
      expect(category).to_not be_valid
    end
  end
end
