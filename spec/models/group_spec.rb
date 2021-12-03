# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:money_tracks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
  end
end
