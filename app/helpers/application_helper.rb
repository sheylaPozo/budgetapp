module ApplicationHelper
  def go_back
    request.env['HTTP_REFERER']
  end
end
