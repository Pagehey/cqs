class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show]

  def index
    @events = Event.all
  end

  def show
    respond_to do |format|
      format.html { redirect_to event_path @event }
      format.js
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
