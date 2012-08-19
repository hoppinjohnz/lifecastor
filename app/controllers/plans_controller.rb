class PlansController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @plan = current_user.plans.build(params[:plan])
    if @plan.save
      flash[:success] = "Plan created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @plan.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @plan = current_user.plans.find_by_id(params[:id])
      redirect_to root_url if @plan.nil?
    end
end
