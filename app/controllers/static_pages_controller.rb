class StaticPagesController < ApplicationController
  def home
    @plan = current_user.plans.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
