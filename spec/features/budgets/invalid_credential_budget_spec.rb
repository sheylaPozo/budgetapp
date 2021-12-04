# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Budget New Page', type: :feature do
  login_user
  background do
    @food = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['hockey']))
    @clothes = create(:category, name: 'clothes', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['basketball']))
    @budget = create(:budget, name: 'Taken', user: @user, categories: [@food, @clothes])
    visit(new_budget_path)
  end

  describe 'budget new Page' do
    scenario 'with invalid credentials' do
      within 'form' do
        fill_in 'budget[name]', with: ''
        fill_in 'budget[amount]', with: ''
        select '', from: 'budget_category_ids', match: :first
      end
      click_button 'Save'
      expect(current_path).to eq budgets_path
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Amount can't be blank")
      expect(page).to have_content('Amount is not a number')
    end
  end
end
