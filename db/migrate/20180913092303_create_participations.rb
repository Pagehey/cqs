class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.integer :number_of_places_wanted
      t.text :message
      t.text :comment
      t.string :status
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
