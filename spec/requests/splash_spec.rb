require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /index' do
    before(:each) do
      get root_path
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct view' do
      assert_template 'splash/index'
    end

    it 'should include list of categories created by user' do
      expect(response.body).to include('LOG IN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
