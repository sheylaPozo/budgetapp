require 'rails_helper'

RSpec.feature 'Category Index Page', type: :feature do
  login_user
  background do
    create(:category, user: @user, icon: Faker::LoremFlickr.image(size: '50x60', search_terms: ['fitness']))
    create(:category, user: @user, icon: Faker::LoremFlickr.image(size: '50x60', search_terms: ['sports']))
    @user.categories.first.treaties.create([{ name: 'Treaty 1', amount: 100, user: @user },
                                            { name: 'Treaty 2', amount: 100, user: @user }])
    visit(categories_path)
  end

  describe 'Category Index Page' do
    context 'when user is logged in' do
      scenario 'with categories i should see list of categories' do
        all_images = all('img')
        expect(all_images.size).to eq(@user.categories.count)
        @user.categories.each do |category|
          expect(page).to have_content(category.name)
          expect(page).to have_content("$#{category.total_amount}")
        end
        all_images.each_with_index { |_val, i| expect(all_images[i][:src]).to eq(@user.categories[i].icon) }
      end
      it 'i should see add new link' do
        expect(find_link('ADD A NEW CATEGORY').visible?).to be true
        click_link('ADD A NEW CATEGORY')
        expect(page.current_path).to eq(new_category_path)
      end
      it 'i should go to selected category detail page' do
        click_link("category#{@user.categories.last.id}")
        expect(page.current_path).to eq(category_path(@user.categories.last))
      end
    end
  end
end
