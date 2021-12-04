# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index when user is logged in' do
    login_user
    before(:each) do
      @food = create(:category, name: 'Food', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['politics']))
      @clothes = create(:category, name: 'clothes', user: @user, icon: Faker::Company.logo)
      @budget1 = create(:budget, name: 'budget1', user: @user, categories: [@food, @clothes])
      @budget2 = create(:budget, name: 'budget2', user: @user, categories: [@food, @clothes])
      @clothes.budgets.push(@budget1, @budget2)
      get categories_path
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct view' do
      assert_template 'categories/index'
    end

    it 'should include list of categories created by user' do
      expect(response.body).to include('Food')
      expect(response.body).to include('clothes')
      expect(response.body).to include("$#{@clothes.budgets.sum(:amount)}")
    end
  end

  describe 'GET /index user is not logged in' do
    before(:each) { get categories_path }

    it 'should return http status code 302' do
      expect(response).to have_http_status(302)
    end

    it 'should redirect to login page' do
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET /new' do
    login_user
    before(:each) { get new_category_path }

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct view' do
      assert_template 'categories/new'
    end
  end

  describe 'GET /create' do
    login_user
    let(:valid_attributes) { { name: 'Category spec', icon: Faker::LoremFlickr.image(search_terms: ['books']) } }
    let(:invalid_attributes) { { name: '', icon: '' } }
    context 'with valid parameters' do
      it 'should create a new category and redirect to categories_path' do
        post categories_path, params: { category: valid_attributes }
        expect(response).to redirect_to(categories_path)
        follow_redirect!
        expect(response.body).to include 'Category created successfully'
      end
    end
    context 'without valid parameters' do
      it 'should not create a new category' do
        post categories_path, params: { category: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response.body).to include('Name can&#39;t be blank')
      end
    end
  end

  describe 'GET /show' do
    login_user
    before(:each) do
      @food = create(:category, name: 'Yam', user: @user, icon: Faker::LoremFlickr.image(search_terms: ['business']))
      @budget1 = create(:budget, name: 'budget Yam 1', user: @user, categories: [@food])
      @budget2 = create(:budget, name: 'budget Yam 2', user: @user, categories: [@food])
      @food.budgets.push(@budget1, @budget2)
      get category_path(@food)
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct view' do
      assert_template 'categories/show'
    end

    it 'should include category and its transactions' do
      expect(response.body).to include('Yam')
      expect(response.body).to include("$#{@food.budgets.sum(:amount)}")
      @food.budgets.each do |budget|
        expect(response.body).to include(budget.name)
        expect(response.body).to include("$#{budget.amount}")
        expect(response.body).to include(budget.created_at.strftime('%-d %h %Y'))
      end
    end
  end
end
