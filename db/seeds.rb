# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Database clean-up"
UserGenre.delete_all
Genre.delete_all
UserInstrument.delete_all
Message.delete_all
Connection.delete_all
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

puts 'Create genres'
genre_list = ['Jazz', 'Rock', 'Folk', 'Pop', 'RnB', 'Rap']
8.times do
  Genre.create!(
    name: genre_list.shuffle!.pop
  )
end

all_genres = Genre.all
puts "#{Genre.count} genres created"

puts "Create new users..."
20.times do
  artist = User.create!(
    name: Faker::Name.unique.name,
    email: "#{Faker::Music.unique.chord}@gmail.com",
    password: 'asdfasdf',
    age: Faker::Number.between(from: 18, to: 65),
    location: ['Montreal', 'Quebec City', 'Almaty'].sample,
    bio: Faker::Quote.famous_last_words,
    phone: Faker::PhoneNumber.cell_phone,
    gender: ['male', 'female', 'other'].sample,
    #instrument_ids: all_instruments.sample(3).map(&:id)
    )
  all_instruments.sample(3).each do |instrument|
    UserInstrument.create!(
      proficiency: ['beginner', 'intermediate', 'expert', 'God'].sample,
      user: artist,
      instrument:
    )
  end
  all_genres.sample(3).each do |genre|
    UserGenre.create!(
      user: artist,
      genre:
    )
  end
end
puts "#{User.count} artists created"
