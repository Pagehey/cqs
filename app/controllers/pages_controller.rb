class PagesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:home]

  def home
    @first_three_events = Event.order(:start_date).first(3)
  end

  def permaculture
  end

  def association
  end

  def ecoasis
  end

  def agenda
    @events = Event.where('start_date > ?', Date.today).order(:start_date)

    if %w[atelier evenement formation].include? params[:category]
      @events = @events.with_category params[:category]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
