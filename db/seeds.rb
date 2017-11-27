# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "création de users"

User.create(first_name: "Bob",last_name: "paillard", status: true, description: "pleureur de fou", password: "11111111", password_confirmation: "11111111", email: "bob@gmail.com")
User.create(first_name: "fabien",last_name: "glauck", status: true, description: "pleureur depuis 5 ans", password: "555555555", password_confirmation: "555555555", email: "glauck@gmail.com")
User.create(first_name: "fanny",last_name: "pomme", status: false, password: "222222222", password_confirmation: "222222222", email: "bfanny@gmail.com")



p "creation d'événements"

Event.create(title: "enterrement madame B", date:"11/10/2018", location: "Paris", user_id: 3)
Event.create(title: "enterrement monsieur bateau", date:"15/10/2018", location: "Bordeaux", user_id: 3)

