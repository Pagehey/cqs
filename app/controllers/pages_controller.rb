class PagesController < ApplicationController
  def home
    @first_three_events = Event.order(:start_date).first(3)
  end

  def permaculture
  end

  def association
  end

  def ecoasis
  end

  def main_events
  end

  def agenda
    @events = Event.upcoming

    if %w[atelier evenement formation].include? params[:category]
      @events = @events.with_category params[:category]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

end
