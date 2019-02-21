class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_event, except: [:index, :new, :create]

  def index
    @events = Event.order(start_date: :desc).includes(:participations)
  end

  def show
    @unread_count = @event.participations.unread_by(current_user).size
    respond_to do |format|
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
      flash[:alert] = "Merci d'ajouter une photo à l'événement." if @event.photo.blank?
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
    flash[:notice] = "L'événement \"#{@event.title}\" a été supprimé avec succès."
    @event.destroy
    redirect_to admin_events_path
  end

  def close
    @event.out_of_places = true
    @event.save
    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.js
    end
  end

  def open
    @event.out_of_places = false
    @event.save
    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.js
    end
  end

  def mark_participations_as_read
     Participation.mark_as_read! @event.participations, for: current_user
     redirect_to admin_events_path
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

  def is_admin?
    unless current_user.is_admin?
      flash[:alert] = "Vous devez avoir un compte administrateur pour accéder à cette page."
      redirect_to root_path
    end
  end
end
