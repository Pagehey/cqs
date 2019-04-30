class ParticipationsController < ApplicationController
  def create
    @participation       = Participation.new(participation_params)
    @event               = Event.find(params[:event_slug])
    @participation.event = @event

    if @participation.save
      flash[:notice] = "demande d'inscription envoyée"
      redirect_to agenda_path
    else
      render 'events/show'
    end
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
