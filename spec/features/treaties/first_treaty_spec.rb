require 'rails_helper'

RSpec.feature 'Treaty New Page', type: :feature do
  login_user
  background do
    @bag = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['bags']))
    @treaty = create(:treaty, name: 'Taken', user: @user, categories: [@bag])
    visit(new_treaty_path)
  end

  describe 'Treaty new Page' do
    scenario 'with unique name' do
      within 'form' do
        fill_in 'treaty[name]', with: @treaty.name
        fill_in 'treaty[amount]', with: '10'
        select @bag.name, from: 'treaty_category_ids'
      end
      click_button 'Save'
      expect(current_path).to eq treaties_path
      expect(page).to have_content('Name already taken by you')
    end
  end
end
