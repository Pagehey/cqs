class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new(participation_params)
    @event = Event.find(params[:event_id])
    @participation.event = @event
    if @participation.save
      flash.notice = "demande d'inscription enregistrée"
      redirect_to root_path
    else
      # raise
      @participation = Participation.new(participation_params)
      flash.alert = "demande non enregistrée, vérifiez les erreurs"
      render :new
      # render 'events/show'
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
