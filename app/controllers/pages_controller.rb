class PagesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def permaculture
  end

  def association
  end

  def agenda
    if params[:category].present?
      @events = Event.where(category: params[:category])
    else
      @events = Event.all
    end
  end
  respond_to do |format|
    format.html { redirect_to agenda_path }
    format.js
  end
end
