class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.string :number_of_places
      t.string :out_of_places

      t.timestamps
    end
  end
end
