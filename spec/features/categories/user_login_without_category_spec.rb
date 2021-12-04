require 'rails_helper'

RSpec.feature 'Category Index Page', type: :feature do
  login_user
  background do
    visit(categories_path)
  end

  describe 'Category Index Page' do
    context 'when user is logged in' do
      scenario 'without categories i should see no categories for now' do
        expect(page).to have_content('No categories for now')
      end
      it 'should see add new link' do
        expect(find_link('ADD A NEW CATEGORY').visible?).to be true
        click_link('ADD A NEW CATEGORY')
        expect(page.current_path).to eq(new_category_path)
      end
    end
  end
end
