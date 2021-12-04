require 'rails_helper'

RSpec.feature 'Signup Page', type: :feature do
  describe 'User signs up' do
    let(:name) { 'name' }
    let(:email) { 'email@email.com' }
    let(:password) { 'password' }
    before do
      visit new_user_registration_path
    end

    scenario 'with valid credentials' do
      within 'form' do
        fill_in 'user[name]', with: name
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: password
      end
      click_button 'Next'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'invalid when email already exists' do
      new_user = create(:user)
      fill_in 'user_name', with: new_user.name
      fill_in 'user_email', with: new_user.email
      fill_in 'user_password', with: new_user.password
      fill_in 'user_password_confirmation', with: new_user.password
      click_button 'Next'
      expect(page).to have_text 'Email has already been taken'
    end
  end
end
