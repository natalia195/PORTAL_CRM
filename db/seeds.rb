# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Crear 3 usuarios con las credenciales dadas

    User.create(email: "admin@gmail.com", password: "291ABASD932")
    User.create(email: "usuario1@gmail.com", password: "291ABASD934")
    User.create(email: "usuario2@gmail.com", password: "281ABASD932")


# Crear 10 prospectos en diferentes estados, dónde 3 tengan al menos una conversación

10.times do
    Prospect.create(user_id: User.all.sample.id, first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, status: ["Prospecto", "Muy interesado", "Cliente"].sample )
end

# Crear conversaciones

3.times do
    @prospect = Prospect.all.sample
    (rand(1..3)).times do
        Conversation.create(prospect_id: @prospect.id, message: Faker::Lorem.paragraphs(number: 1))
    end
end