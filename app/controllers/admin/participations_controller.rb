module Admin
  class ParticipationsController < ApplicationController
    def destroy
      @participation = Participation.find(params[:id])

      @participation.destroy

      redirect_to admin_events_path
    end
  end
end
