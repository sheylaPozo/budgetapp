# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.new(name: 'sheyla', email: 'sheyla@mail.com', password: '123456') }
  let(:group) { Group.create(name: 'Fast Food', icon: 'http//', user: user) }
  let(:budget) { budget.create(name: 'Hamburger', amount: 10, user: user) }

  describe '#index' do
    before do
      sign_in user
      group.budgets << budget
      visit group_path(group)
    end

    it { expect(page).to have_content('BUDGETAPP') }
    it { expect(page).to have_content('Fast Food') }
    it { expect(page).to have_css("img[src*='http//']") }
    it { expect(page).to have_content('Hamburger') }
    it { expect(page).to have_content('$10') }
    it { expect(page).to have_selector('input[type=submit]') }
  end
end
