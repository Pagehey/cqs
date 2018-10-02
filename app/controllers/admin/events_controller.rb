class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show]

  def index
    @events = Event.all.order(start_date: :desc)
  end

  def show
    respond_to do |format|
      format.html { redirect_to event_path @event }
      format.js
    end
  end

  def new
    @event = Event.new
  end

  def close
    @event = Event.find(params[:event_id])
    @event.out_of_places = true
    @event.save
    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.js
    end
  end

  def open
    @event = Event.find(params[:event_id])
    @event.out_of_places = false
    @event.save
    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.js
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
