# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.where(params[:id]).order(created_at: 'DESC')
  end

  def show
    @group = Group.find(params[:id])
    @group_budgets = @group.budgets.order(created_at: 'DESC')
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      redirect_to budget_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
