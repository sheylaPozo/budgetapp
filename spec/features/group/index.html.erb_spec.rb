# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.new(name: 'Sheyla', email: 'Sheyla@mail.com', password: '12345') }

  describe '#index' do
    before do
      Group.create(name: 'Fast Food', icon: 'http//', user: user)
      sign_in user
      visit budget_path
    end

    context 'when rendering index page' do
      it { expect(page).to have_content('CATEGORIES') }
      it { expect(page).to have_content('Fast Food') }
      it { expect(page).to have_css("img[src*='http//']") }
    end

    context 'click on the button' do
      it 'should render to #new page' do
        click_on 'CREATE'
        expect(current_path).to eq(new_group_path)
      end
    end
  end
end
