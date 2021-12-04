# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Budget, type: :model do
  describe 'validations' do
    let(:budget) do
      create(:budget, categories: [create(:category, icon: Faker::LoremFlickr.image(search_terms: ['cups']))])
    end
    it 'name should be present' do
      budget.name = nil
      expect(budget).to_not be_valid
    end

    it 'amount should be present' do
      budget.amount = nil
      expect(budget).to_not be_valid
    end

    it 'aleast one category should be present' do
      budget.categories = []
      expect(budget).to_not be_valid
    end

    it 'owner should be present' do
      budget.user = nil
      expect(budget).to_not be_valid
    end
  end
end
