# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Database clean-up"
Instrument.delete_all
User.delete_all

puts 'Create instruments'
instrument_list = ['Piano', 'Guitar', 'Violin', 'Drums', 'Saxophone', 'Flute', 'Clarinet', 'Cello']
8.times do
  Instrument.create!(
    name: instrument_list.shuffle!.pop
  )
end

all_instruments = Instrument.all
puts "#{Instrument.count} instruments created"

puts "Create new users..."
20.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: "#{Faker::Music.unique.chord}@gmail.com",
    password: 'asdfasdf',
    age: Faker::Number.between(from: 18, to: 65),
    location: ['Montreal', 'Quebec City', 'Almaty'].sample,
    bio: Faker::Quote.famous_last_words,
    phone: Faker::PhoneNumber.cell_phone,
    gender: ['male', 'female', 'other'].sample,
    #user_instruments: all_instruments.sample.name
    )
  end
puts "#{User.count} artists created"
