# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Budgets New Page', type: :feature do
  login_user
  background do
    @bag = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['bags']))
    @budget = create(:budget, name: 'Taken', user: @user, categories: [@bag])
    visit(new_budget_path)
  end

  describe 'budget new Page' do
    scenario 'with unique name' do
      within 'form' do
        fill_in 'budget[name]', with: @budget.name
        fill_in 'budget[amount]', with: '10'
        select @bag.name, from: 'budget_category_ids'
      end
      click_button 'Save'
      expect(current_path).to eq budgets_path
      expect(page).to have_content('Name already taken by you')
    end
  end
end
