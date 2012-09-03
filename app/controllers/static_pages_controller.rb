class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @plan = current_user.plans.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      # @lifecastor = Lifecastor.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
