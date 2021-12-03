# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET #home' do
    before { get root_path }
    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'home' template" do
      expect(response).to render_template('home')
    end
  end
end
