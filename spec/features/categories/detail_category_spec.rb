# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Category Show Page', type: :feature do
  login_user
  background do
    create(:category, user: @user, icon: Faker::LoremFlickr.image(size: '50x60', search_terms: ['phones']))
    @user.categories.first.budgets.create([{ name: 'Budget detail 1', amount: 100, user: @user },
                                           { name: 'Budget detail 2', amount: 100, user: @user }])
    visit(category_path(@user.categories.first))
  end

  describe 'Category Show Page' do
    it 'i should see a category with associated transactions' do
      expect(all('img').size).to eq(1)
      all('img').each { |img| expect(img[:src]).to eq(@user.categories.first.icon) }
      expect(page).to have_content(@user.categories.first.name)
      expect(page).to have_content("$#{@user.categories.first.total_amount}")
      @user.categories.first.budgets.each do |budget|
        expect(page).to have_content(budget.name)
        expect(page).to have_content("$#{budget.amount}")
        expect(page).to have_content(budget.created_at.strftime('%-d %h %Y at %I:%M%P'))
      end
    end
    it 'should see add new transaction link' do
      expect(find_link('ADD A NEW TRANSACTION').visible?).to be true
      click_link('ADD A NEW TRANSACTION')
      expect(page.current_path).to eq(new_budget_path)
    end
  end
end
