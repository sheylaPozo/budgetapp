# frozen_string_literal: true

class BudgetsController < ApplicationController
  load_and_authorize_resource

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user = current_user
    if @budget.save
      flash[:notice] = 'Budget created successfully'
      redirect_to category_path(@budget.categories.first.id)
    else
      flash[:alert] = 'Budget not created'
      render :new
    end
  end

  def budget_params
    params.require(:budget).permit(:name, :amount, category_ids: [])
  end
end
