class EventsController < ApplicationController
  before_action :set_event, only: :show

  def index
  end

  def show
    @participation = Participation.new
  end

  private

  def set_event
    @event = Event.find(params[:slug])
  end
end
