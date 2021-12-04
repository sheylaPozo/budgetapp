# frozen_string_literal: true

class SplashController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index; end
end
