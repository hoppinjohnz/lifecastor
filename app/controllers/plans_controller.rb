class PlansController < ApplicationController
  before_filter :signed_in_user

  def create
    @plan = current_user.plans.build(params[:plan])
    if @plan.save
      flash[:success] = "Plan created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end
