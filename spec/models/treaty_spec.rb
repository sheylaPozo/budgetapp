require 'rails_helper'

RSpec.describe Treaty, type: :model do
  describe 'validations' do
    let(:treaty) do
      create(:treaty, categories: [create(:category, icon: Faker::LoremFlickr.image(search_terms: ['cups']))])
    end
    it 'name should be present' do
      treaty.name = nil
      expect(treaty).to_not be_valid
    end

    it 'amount should be present' do
      treaty.amount = nil
      expect(treaty).to_not be_valid
    end

    it 'aleast one category should be present' do
      treaty.categories = []
      expect(treaty).to_not be_valid
    end

    it 'owner should be present' do
      treaty.user = nil
      expect(treaty).to_not be_valid
    end
  end
end
