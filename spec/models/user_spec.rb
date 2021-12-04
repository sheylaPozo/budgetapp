require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }
    it 'name should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'name length should be less than 50' do
      user.name = 'wale' * 100
      expect(user).to_not be_valid
    end

    it 'email should be present' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end
end
