# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Budgets', type: :request do
  login_user
  before(:each) do
    @food = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['foods']))
    @clothes = create(:category, name: 'Clothes', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['drinks']))
  end
  let(:valid_attributes) { { name: 'Budgets spec', amount: 10, category_ids: [@food.id, @clothes.id] } }
  let(:invalid_attributes) { { name: '', amount: '', category_ids: [''] } }
  describe 'GET /new' do
    before(:each) do
      get new_budget_path
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct view' do
      assert_template 'budgets/new'
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'should create a new deal and redirect to the first catgeory of the deal' do
        post budgets_path, params: { budget: valid_attributes }
        expect(response).to redirect_to(category_path(@food.id))
        follow_redirect!
        expect(response.body).to include 'budget created successfully'
      end
    end
    context 'without valid parameters' do
      it 'should not create a new deal' do
        post budgets_path, params: { budget: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response.body).to include('Name can&#39;t be blank')
      end
    end
  end
end
