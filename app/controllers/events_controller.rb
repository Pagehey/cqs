class EventsController < ApplicationController
  before_action :set_event, only: :show

  def show
    @participation = Participation.new
    render :event_not_found if @event.out_of_places || @event.end_date < Date.today
  end

  private

  def set_event
    @event = Event.find(params[:slug])
  rescue ActiveRecord::RecordNotFound
    render :event_not_found
  end
end
