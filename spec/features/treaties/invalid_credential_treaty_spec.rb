require 'rails_helper'

RSpec.feature 'Treaty New Page', type: :feature do
  login_user
  background do
    @food = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['hockey']))
    @garri = create(:category, name: 'Garri', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['basketball']))
    @treaty = create(:treaty, name: 'Taken', user: @user, categories: [@food, @garri])
    visit(new_treaty_path)
  end

  describe 'Treaty new Page' do
    scenario 'with invalid credentials' do
      within 'form' do
        fill_in 'treaty[name]', with: ''
        fill_in 'treaty[amount]', with: ''
        select '', from: 'treaty_category_ids', match: :first
      end
      click_button 'Save'
      expect(current_path).to eq treaties_path
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Amount can't be blank")
      expect(page).to have_content('Amount is not a number')
    end
  end
end
