class budgets_Controller < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @budget = budget.new
  end

  def create
    @group = Group.find(group_id)
    @budget = @group.add_budget(budget_params)
    redirect_to @group
  rescue ActiveRecord::RecordInvalid
    render :new, group_id: group_id
  end

  private

  def group_id
    params.dig(:budget, :group_id) || params[:group_id]
  end

  def budget_params
    params.require(:budget).permit(:name, :amount).merge(user: current_user)
  end
end
