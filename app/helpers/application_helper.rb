# frozen_string_literal: true

module ApplicationHelper
  def go_back
    request.env['HTTP_REFERER']
  end
end
