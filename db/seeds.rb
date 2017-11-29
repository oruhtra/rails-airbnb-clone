# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Creating 20 pleureurs"

20.times do
  passeword = Faker::Internet.password(8)
  User.create(
   first_name: Faker::Name.first_name,
   last_name: Faker::Cat.name,
   status: true,
   tarif: (56..250).to_a.sample,
   description: Faker::HowIMetYourMother.quote,
   password: passeword,
   password_confirmation: passeword,
   email: Faker::Internet.safe_email,
   photo: "https://loremflickr.com/320/240/man,girl,profil,sad",
   phone_number: Faker::Number.number(10),
   location: Faker::Address.street_address
   )
end



p "creation d'événements"

Event.create(title: "enterrement madame B", date:"11/10/2018", location: "Paris", user_id: 3)
Event.create(title: "enterrement monsieur bateau", date:"15/10/2018", location: "Bordeaux", user_id: 3)

