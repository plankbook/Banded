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
genre_list = ['Jazz', 'Rock', 'Folk', 'Pop', 'RnB', 'Rap', 'Blues', 'Electro']
8.times do
  Genre.create!(
    name: genre_list.shuffle!.pop
  )
end

all_genres = Genre.all
puts "#{Genre.count} genres created"

user_bios = [
  "Hi there! I'm a passionate musician dedicated to creating captivating melodies and heartfelt lyrics. My music is a reflection of my soul, blending elements of various genres to craft a unique and authentic sound. Join me on this musical journey as I share my stories and emotions through every note I play and every word I sing.",

  "Welcome to my world of music! I'm a musician driven by a deep love for melodies and rhythms. With my heartfelt lyrics and evocative compositions, I aim to touch hearts and connect with listeners on a profound level. Join me as I explore the endless possibilities of sound and strive to create an unforgettable musical experience.",

  "Music is my language, and I'm here to share my story through captivating tunes and heartfelt lyrics. As a musician, I pour my heart and soul into every note, seeking to create an emotional connection with my audience. Join me on this musical adventure as we embark on a journey of self-discovery and exploration through the power of music.",

  "Hey there! I'm a musician on a mission to create melodies that resonate with the depths of the human experience. Through my music, I hope to inspire, uplift, and bring solace to those who listen. With a blend of soulful vocals and intricate instrumentals, I invite you to join me on this sonic voyage as we explore the beauty and complexity of life.",

  "Greetings, music lovers! I'm a passionate musician who believes in the transformative power of melodies. My music is a reflection of my emotions and experiences, serving as a cathartic outlet for both myself and my listeners. Together, let's embark on a sonic journey filled with joy, introspection, and the shared love for the art of music.",

  "Welcome to my musical realm! I'm a dedicated musician who lives and breathes the enchanting world of melodies. Through my compositions and performances, I strive to evoke emotions and create an immersive experience for every listener. Join me as I weave tales of love, heartbreak, and everything in between, set to the backdrop of captivating harmonies.",

  "Hey, music enthusiasts! I'm a musician who finds solace and inspiration in the universal language of music. With my heartfelt lyrics and soulful melodies, I aim to create a musical haven that resonates with people from all walks of life. Come join me on this melodic journey as we explore the depths of human emotions and the power of sonic expression.",

  "Greetings, fellow music lovers! I'm a passionate musician with a penchant for crafting melodies that strike a chord within the souls of my listeners. Through my music, I hope to ignite a spark of inspiration, provoke thought, and offer a respite from the everyday chaos. Join me on this melodic expedition as we traverse the realms of rhythm, harmony, and lyrical storytelling.",

  "Hello, beautiful souls! I'm a musician with an unwavering belief in the transformative power of music. Through my compositions, I strive to create an ethereal atmosphere that transcends boundaries and connects hearts. Join me on this sonic odyssey as we embark on a journey of self-discovery, healing, and unadulterated joy through the enchanting world of music.",

  "Welcome to my musical universe! I'm a musician who seeks to create an emotional connection with my listeners through my heartfelt lyrics and melodious compositions. My songs are a reflection of the highs and lows of life, celebrating the beauty of human experiences. Join me as we embark on a sonic adventure filled with passion, vulnerability, and the magic of music.",

  "Hey there, music aficionados! I'm a musician who believes that melodies have the power to heal and uplift spirits. With my soulful voice and heartfelt lyrics, I aspire to create a safe haven in the midst of chaos. Join me on this musical expedition as we explore the realms of vulnerability, love, and the extraordinary power of harmonious sounds.",

  "Greetings, fellow music enthusiasts! I'm a musician driven by a relentless passion for creating melodies that resonate with the depths of the human soul. Through my music, I aim to evoke emotions, spark introspection, and leave a lasting impact on those who lend their ears. Join me on this melodic journey as we delve into the beauty and complexities of the human experience.",

  "Hello, music lovers! I'm a musician on a mission to make the world a more harmonious place. Through my heartfelt lyrics and enchanting melodies, I strive to create a sense of unity and connection among listeners. Join me as we explore the magical realm of music together, where emotions flow freely, and the language of the soul finds its voice.",

  "Welcome to my musical sanctuary! I'm a passionate musician dedicated to creating a sonic tapestry that resonates with the essence of life. Through my compositions, I aim to ignite imagination, evoke emotions, and transport listeners to a world where melodies paint vivid pictures and words take flight. Join me on this enchanting musical voyage as we uncover the beauty hidden within the symphony of existence.",

  "Hey, music enthusiasts! I'm a musician who believes in the power of melodies to transcend barriers and touch hearts. With a blend of soulful vocals and heartfelt songwriting, I aim to create an emotional connection that resonates with the core of human experience. Join me on this musical journey as we navigate through the ebbs and flows of life, finding solace and inspiration in the universal language of music.",

  "Greetings, beautiful souls! I'm a musician with a burning desire to create melodies that encapsulate the myriad of human emotions. Through my music, I strive to uplift spirits, evoke nostalgia, and instill a sense of wonder in the hearts of listeners. Join me as we embark on a melodic expedition, where harmonies become the vessel for self-discovery, connection, and pure bliss.",

  "Hello, fellow music enthusiasts! I'm a musician who believes in the power of melodies to heal, inspire, and transform. With my heartfelt lyrics and soul-stirring compositions, I strive to create a sonic landscape that invites listeners to embark on an inner journey of self-reflection and growth. Join me as we explore the infinite possibilities of sound and the profound impact it can have on our lives.",

  "Hey there, music lovers! I'm a passionate musician driven by a deep love for the art of sonic storytelling. Through my compositions and performances, I aim to create an immersive experience that transcends the ordinary and touches the depths of the soul. Join me on this melodic adventure as we traverse the landscapes of emotions, dreams, and the extraordinary power of music.",

  "Welcome to my musical realm! I'm a musician who believes in the universal language of melodies. With my heartfelt lyrics and evocative harmonies, I strive to create an emotional connection that transcends barriers and unites hearts. Join me on this melodic journey as we explore the intricacies of the human experience, celebrate the power of vulnerability, and find solace in the transformative magic of music.",

  "Greetings, fellow souls who are moved by the power of music! I'm a musician who pours my heart and soul into every melody I create. Through my compositions, I strive to paint a vivid sonic landscape that resonates with the joys, sorrows, and triumphs of life. Join me on this melodic pilgrimage as we embark on a voyage of self-discovery, connection, and the boundless potential of harmonious sounds."
]

puts 'Getting musician images from Unsplash...'
unsplash_images = Unsplash::Photo.search('musicians', 1, 20)

unsplash_urls = []
unsplash_images.each do |unsplash_image|
  url = unsplash_image.urls.regular
  unsplash_urls << url
end

puts "Create new users..."
20.times do
  artist = User.create!(
    name: Faker::Name.unique.name,
    email: "#{Faker::Music.unique.chord}@gmail.com",
    password: 'asdfasdf',
    age: Faker::Number.between(from: 18, to: 65),
    location: ['Montreal', 'Quebec City', 'Châteauguay', 'Laval', 'Gatineau', 'Longueuil', 'Trois-Rivières'].sample,
    bio: user_bios.shuffle!.pop,
    phone: Faker::PhoneNumber.cell_phone,
    gender: ['male', 'female', 'other'].sample
    #instrument_ids: all_instruments.sample(3).map(&:id)
    )

  artist.photo.attach(
    filename: 'avatar.jpg',
    io: URI.open(unsplash_urls.shuffle!.pop)
  )

  # artist.photo.attach(
  #   filename: 'avatar.jpg',
  #   io: URI.open(
  #     unsplash_images.each do |unsplash_image|
  #       image = Properties::Image.create!(
  #       property: property,
  #       category: Properties::Image.categories.keys.sample,
  #       taken_on: rand(5..200).days.ago,
  #       title: unsplash_image.description,
  #       file_remote_url: unsplash_image.urls.regular
  #     )
  #     Properties::Images::Publisher.(image)
  # )

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
