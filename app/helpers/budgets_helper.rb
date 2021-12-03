# frozen_string_literal: true

module BudgetsHelper
  def group_id
    params.dig(:budget, :group_id) || params[:group_id]
  end
end
