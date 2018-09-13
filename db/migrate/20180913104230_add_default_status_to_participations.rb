class AddDefaultStatusToParticipations < ActiveRecord::Migration[5.2]
  def change
    change_column_default :participations, :status, "en attente"
  end
end
