# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.new(name: 'sheyla', email: 'sheyla@mail.com', password: '123456') }
  let(:input_type) { %w[text submit] }

  describe '#index' do
    before do
      sign_in user
      visit new_group_path
    end

    it { expect(page).to have_content('NEW CATEGORY') }

    it 'should have email, password inputs' do
      input_type.each do |type|
        expect(page).to have_selector("input[type=#{type}]")
      end
    end
  end
end
