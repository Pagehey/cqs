class PagesController < ApplicationController
  def home
    @first_three_events = Event.upcoming.first(3)
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
    @events         = Event.upcoming
    event_catgories = Event.category.values
    @events         = @events.with_category params[:category] if event_catgories.include? params[:category]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
