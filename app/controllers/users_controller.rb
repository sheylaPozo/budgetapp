# frozen_string_literal: true

class UsersController < ApplicationController
  def home; end

  def new
    @user = User.new
  end
end
