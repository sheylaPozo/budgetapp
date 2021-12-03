# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User view', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe '#home' do
    before { visit root_path }

    it { expect(page.body).to have_content('Budgetapp') }

    context 'button on click' do
      it 'should redirect me to Login page' do
        find_link('loginBtn').click
        expect(current_path).to eq(new_user_session_path)
      end

      it 'should redirect me to Signup page' do
        find_link('signupBtn').click
        expect(current_path).to eq(new_user_registration_path)
      end
    end
  end
end
