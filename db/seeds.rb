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

User.create! email: 'admin@mail.com', password: 'azerty', admin: true

puts "Creating events..."

event = Event.create! title: "Default Event",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now,
                      end_date: DateTime.now + 1,
                      price: 10,
                      number_of_places: 8,
                      category: "Formation",
                      photo: File.open(Rails.root.join("db/fixtures/events/event3pic.jpg"))

event2 = Event.create! title: "Default Event 2",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now,
                      end_date: DateTime.now + 1,
                      price: 0,
                      number_of_places: 12,
                      category: "Formation",
                      photo: File.open(Rails.root.join("db/fixtures/events/event2pic.jpg"))

event3 = Event.create! title: "Default Event 3",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now,
                      end_date: DateTime.now + 1,
                      price: 450,
                      number_of_places: 7,
                      category: "Formation",
                      photo: File.open(Rails.root.join("db/fixtures/events/event4pic.jpg"))

event4 = Event.create! title: "Inititiation à la permaculture",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now,
                      end_date: DateTime.now + 1,
                      price: 10,
                      number_of_places: 8,
                      category: "Formation",
                      photo: File.open(Rails.root.join("db/fixtures/events/event3pic.jpg"))

puts "Creating participations..."

participation = Participation.new first_name: "Luke",
                                  last_name: "Skywalker",
                                  email: "jedi4ever@mail.com",
                                  phone_number: '0234567890',
                                  number_of_places_wanted: 2,
                                  message: "J'aimerai planter des choux sur Tatooine et c'est un peu aride..."

participation2 = Participation.new first_name: "Saruman",
                                  last_name: "Le Blanc",
                                  email: "saruRoxXxor@mail.com",
                                  phone_number: '0234567890',
                                  number_of_places_wanted: 1,
                                  message: "blablablablablablabla\
                                  blablablablablablablablablablablabla\
                                  # blablablablablablablablablablabla
                                  blablablablablablablablablablablablablablabla\
                                  blablablablablablablablabla"

participation.event = event
participation2.event = event2

participation.save!
participation2.save!

puts "Finished!"
