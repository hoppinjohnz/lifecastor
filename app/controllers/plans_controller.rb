require './lifecastor'

class PlansController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def show
    @plan = current_user.plans.find_by_id(params[:id])
    p '11111111111111111111111111111'
    p @plan.income.to_i
    Lifecastor.run
    # use this plan to lifecast
    #
    @result = 'best plan ever'
  end

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
