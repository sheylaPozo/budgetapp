# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Budget New Page', type: :feature do
  login_user
  background do
    @food = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['clothes']))
    @clothes = create(:category, name: 'clothes', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['shoes']))
    @budget = create(:budget, name: 'Taken', user: @user, categories: [@food, @clothes])
    visit(new_budget_path)
  end

  describe 'budget new Page' do
    scenario 'with valid credentials' do
      within 'form' do
        fill_in 'budget[name]', with: 'budget Feature'
        fill_in 'budget[amount]', with: '10'
        select @food.name, from: 'budget_category_ids'
        select @clothes.name, from: 'budget_category_ids'
      end
      click_button 'Save'
      expect(current_path).to eq category_path(@food.id)
      expect(page.has_content?('budget created successfully')).to be_truthy
    end
  end
end
