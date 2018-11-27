class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new(participation_params)
    @event = Event.find_by_slug(params[:event_slug])
    @participation.event = @event
    if @participation.save
      flash.now[:notice] = "demande d'inscription enregistrée"
      redirect_to root_path
    else
      render 'events/show'
    end
  end

  def new
    @participation = Participation.new
    @event = Event.last
  end

  private

  def participation_params
    params.require(:participation).permit(
      :first_name,
      :last_name,
      :phone_number,
      :email,
      :number_of_places_wanted,
      :message
      )
  end
end
