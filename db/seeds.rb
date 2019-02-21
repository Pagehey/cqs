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

puts "Creating events..."

event = Event.create! title: "Approche des modules",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now + 20,
                      end_date: DateTime.now + 21,
                      price: 10,
                      number_of_places: 8,
                      category: "formation",
                      photo: File.open(Rails.root.join("db/fixtures/events/event3pic.jpg"))

event2 = Event.create! title: "Mon potager en permaculture",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now + 30,
                      end_date: DateTime.now + 32,
                      price: 0,
                      number_of_places: 12,
                      category: "formation",
                      photo: File.open(Rails.root.join("db/fixtures/events/event2pic.jpg"))

event3 = Event.create! title: "Perm'apéro",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now + 14,
                      end_date: DateTime.now + 14,
                      price: 0,
                      number_of_places: 12,
                      category: "atelier",
                      photo: File.open(Rails.root.join("db/fixtures/events/event2pic.jpg"))

event4 = Event.create! title: "Journée perm'apprentis",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat commodi quasi, laborum corporis ipsum architecto adipisci? Veritatis minus quam accusamus, tempora commodi voluptatibus iure fugit et qui consectetur rem, cupiditate.",
                      location: "Ecoasis, Guérande",
                      start_date: DateTime.now - 14,
                      end_date: DateTime.now - 14,
                      price: 0,
                      number_of_places: 12,
                      category: "evenement",
                      photo: File.open(Rails.root.join("db/fixtures/events/event2pic.jpg"))

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
                                  message: "Y'a une bande d'abrutis qui ont ravagé mon terrain, je dois tout reprendre à zéro ..."

participation3 = Participation.new first_name: "Clintis",
                                  last_name: "Wood",
                                  email: "plop@mail.com",
                                  phone_number: '0234567891',
                                  number_of_places_wanted: 3,
                                  message: "\"Quand t'es dans le désert ...\" ben y'a pas un chou qui pousse."

participation.event  = event
participation2.event = event2
participation3.event = event2

participation.save!
participation2.save!
participation3.save!

puts "Finished!"
