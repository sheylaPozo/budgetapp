class TreatiesController < ApplicationController
  load_and_authorize_resource

  def new
    @treaty = Treaty.new
  end

  def create
    @treaty = Treaty.new(treaty_params)
    @treaty.user = current_user
    if @treaty.save
      flash[:notice] = 'Treaty created successfully'
      redirect_to category_path(@treaty.categories.first.id)
    else
      flash[:alert] = 'Treaty not created'
      render :new
    end
  end

  def treaty_params
    params.require(:treaty).permit(:name, :amount, category_ids: [])
  end
end
