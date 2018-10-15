class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :isAdmin?
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Événement créé avec succès."
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Événement modifié avec succès."
      redirect_to admin_events_path
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Événement \"#{@event.title}\" supprimé avec succès."
    @event.destroy
    redirect_to admin_events_path
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

  def event_params
    params.require(:event).permit(:title,
                                  :location,
                                  :price,
                                  :number_of_places,
                                  :category,
                                  :photo,
                                  :description,
                                  :start_date,
                                  :end_date
                                  )
  end

  def isAdmin?
    unless current_user.admin
      flash[:alert] = "Vous devez avoir un compte administrateur pour accéder à cette page."
      redirect_to root_path
    end
  end
end
