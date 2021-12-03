# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'sheyla', email: 'sheyla@mail.com', password: '123456') }

  before { user.save }

  describe 'assocciations' do
    it { should have_many(:money_tracks) }
    it { should have_many(:groups) }
  end

  describe 'validations' do
    context 'with correct parameters' do
      it 'name, email, password should be present' do
        expect(user).to be_valid
      end
    end

    context 'with wrong parameters' do
      it 'name should be present' do
        user.name = nil
        expect(user).to_not be_valid
      end

      it 'email should be present' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'email should be present' do
        user.password = nil
        expect(user).to_not be_valid
      end

      it 'name should not be too long' do
        user.name = 'sheyla' * 10
        expect(user).to_not be_valid
      end

      it 'email should not be too long' do
        user.email = 'sheyla.pozoespinoza@mail.com' * 20
        expect(user).to_not be_valid
      end

      it 'password should not be too long' do
        user.password = 'mysecretpassword' * 10
        expect(user).to_not be_valid
      end
    end
  end
end
