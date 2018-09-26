# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."

Participation.destroy_all
Event.destroy_all
User.destroy_all


puts "Creating default admin..."

User.create! email: 'admin@mail.com', password: 'azerty'

puts "Creating events..."

event = Event.create! title: "Default Event",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now,
                      end_date: DateTime.now + 1,
                      price: 10,
                      number_of_places: 8,
                      category: "Formation"

participation = Participation.new first_name: "Luke",
                                  last_name: "Skywalker",
                                  email: "jedi4ever@mail.com",
                                  phone_number: 1234567890,
                                  number_of_places_wanted: 2,
                                  message: "J'aimerai planter des choux sur Tatooine et c'est un peu aride..."

participation.event = event

participation.save!


puts "Finished!"
