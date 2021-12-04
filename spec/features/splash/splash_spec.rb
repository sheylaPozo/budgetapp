require 'rails_helper'

RSpec.feature 'Splash Page', type: :feature do
  describe 'Splash page new user' do
    before do
      visit root_path
    end

    scenario 'Login' do
      click_link 'LOG IN'
      expect(current_path).to eq(new_user_session_path)
    end

    scenario 'Signu' do
      click_link 'SIGN UP'
      expect(current_path).to eq(new_user_registration_path)
    end
  end

  describe 'Splash page loggedin user' do
    login_user
    it 'should redirect to authenticated page' do
      visit root_path
      expect(current_path).to eq(authenticated_root_path)
    end
  end
end
