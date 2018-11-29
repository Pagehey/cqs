class PagesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def permaculture
  end

  def association
  end

  def ecoasis
  end

  def agenda
    if params[:category].present?
      if params[:category] == 'Tous'
        @events = Event.where('start_date > ?', Date.today).order(:start_date)
      else
        @events = Event.where(category: params[:category]).order(:start_date)
      end
    else
      @events = Event.where('start_date > ?', Date.today).order(:start_date)
    end
  end
  respond_to do |format|
    format.html { redirect_to agenda_path }
    format.js
  end
end
