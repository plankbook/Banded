require 'faker'

puts "Database clean-up"
  Comment.delete_all
  Post.delete_all
  UserProject.delete_all
  Project.delete_all
  UserGenre.delete_all
  Genre.delete_all
  UserInstrument.delete_all
  Message.delete_all
  Connection.delete_all
  Instrument.delete_all
  User.delete_all

puts 'Creating instruments'
  instrument_list = ['Piano', 'Guitar', 'Violin', 'Drums', 'Saxophone', 'Flute', 'Trumpet', 'Banjo', 'Accordion', 'Maracas']
  10.times do
    Instrument.create!(
      name: instrument_list.shuffle!.pop
    )
  end

  all_instruments = Instrument.all
  puts "#{Instrument.count} instruments created"

puts 'Create genres'
  genre_list = [
    { name: 'Jazz', colour: '#F6FA70' },
    { name: 'Rock', colour: '#EA906C' },
    { name: 'Folk', colour: '#B1A9FF' },
    { name: 'Pop', colour: '#FF78C4' },
    { name: 'RnB', colour: '#D8EEBA' },
    { name: 'Rap', colour: '#7BB146' },
    { name: 'Blues', colour: '#AFD1EF' },
    { name: 'Electro', colour: '#FA8E8E' }
  ]

  genre_list.each do |genre|
    puts "Creating #{genre[:name]}"
    Genre.create!(
      name: genre[:name], colour: genre[:colour]
    )
  end

  all_genres = Genre.all
  puts "#{Genre.count} genres created"

puts "Creating user bios"
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

# commented out
  # puts 'Getting musician images from Unsplash...'
  # unsplash_images = Unsplash::Photo.search('musicians', 1, 20)

  # unsplash_urls = []
  # unsplash_images.each do |unsplash_image|
  #   url = unsplash_image.urls.regular
  #   unsplash_urls << url
  # end


project_banners = Dir.glob(Rails.root.join('app', 'assets', 'images', 'project-banners', '*.jpg'))
puts "Creating projects"
  all_projects = []
  20.times do
    project = Project.create(
      name: Faker::Music.band,
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
    project.photo.attach(io: File.open(project_banners.shuffle!.pop), filename: "project_banner.jpg")
    all_projects << project
  end


  puts "Projects created!"

user_avatars = Dir.glob(Rails.root.join('app', 'assets', 'images', 'user-avatars', '*.jpeg'))
  # user_photo = Rails.root('app/assets/images/user-avatars/photo-1471565661762-b9dfae862dbe.jpeg')

every_user = []
puts "🥖 Arnaud is being born!"
  arnaud = User.create!(
    name: 'Arnaud Lecorvaisier',
    email: 'arnaud@banded.com',
    password: '123456',
    location: "Montreal",
    age: 33,
    bio: "I'm working in logistics and I discovered progamming through vba with Microsoft office which was really interesting. To change my career has always been in a side of my head since that moment and I decided to move on this year by doing this bootcamp. I'm sure that I will learn a lot of new skills and meet a lot of interesting people !!"
  )

  arnaud.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/leouagon/mowgli.png"), filename: "avatar.jpg")

  all_instruments.sample((rand(1..6))).each do |instrument|
    UserInstrument.create!(

      proficiency: ['Beginner', 'Intermediate', 'Professional', 'Expert', 'God'].sample,

      user: arnaud,
      instrument:
    )
  end

  all_genres.sample((rand(1..5))).each do |genre|
    UserGenre.create!(
      user: arnaud,
      genre:
    )
  end

  all_projects.sample((rand(1..5))).each do |project|
    UserProject.create!(
      user: arnaud,
      project:,
      admin: [true, false].sample
    )
  end

  every_user << arnaud
  puts "🥖 It's a boy!"

puts "🪆 It's Robert's turn."
  robert = User.create!(
    name: 'Robert Li',
    email: 'robert@banded.com',
    password: '123456',
    location: "Montreal",
    age: 27,
    bio: 'My name is Robert Li! I currently work as a Revenue Operations Manager at Zendesk. Even though my academic background is in Finance and Mathematics, I was always fascinated by the technology and the computer science field, so I decided to join Le Wagon to build my coding skillset and dive deeper into that industry.'
  )

  robert.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/leouagon/robert.jpg"), filename: "avatar.jpg")
  all_instruments.sample((rand(1..6))).each do |instrument|
    UserInstrument.create!(

      proficiency: ['Beginner', 'Intermediate', 'Expert', 'God'].sample,

      user: robert,
      instrument:
    )
  end

  all_genres.sample((rand(1..5))).each do |genre|
    UserGenre.create!(
      user: robert,
      genre:
    )
  end

  all_projects.sample((rand(1..5))).each do |project|
    UserProject.create!(
      user: robert,
      project:,
      admin: [true, false].sample
    )
  end
  every_user << robert
  puts "🪆 Кто не рискует, тот не пьет шампанского"

puts "🍁 Hi, Chris!"
  chris = User.create!(
    name: 'Chris Kyras',
    email: 'chris@banded.com',
    password: '123456',
    location: "Montreal",
    age: 35,
    bio: "Passionate entrepreneur Y Combinator alum with a focus on building things to positively disrupt people's lives for good, with a particular focus on fintech and retail."
  )

  chris.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/leouagon/chris.jpg"), filename: "avatar.jpg")

  all_instruments.sample((rand(1..6))).each do |instrument|
    UserInstrument.create!(

      proficiency: ['Beginner', 'Intermediate', 'Expert', 'God'].sample,

      user: chris,
      instrument:
    )
  end

  all_genres.sample((rand(1..5))).each do |genre|
    UserGenre.create!(
      user: chris,
      genre:
    )
  end

  all_projects.sample((rand(1..5))).each do |project|
    UserProject.create!(
      user: chris,
      project:,
      admin: [true, false].sample
    )
  end

  every_user << chris
  puts "🍁 Shania and Céline in da haus"


puts "🏳️‍🌈 It's pronounced 'Aimerais'"
  emre = User.create!(
    name: 'Emre Özen',
    email: 'emre@banded.com',
    password: '123456',
    location: "Montreal",
    age: 900,
    bio: 'Translator and project manager'
  )

  emre.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/leouagon/aimerais.jpg"), filename: "avatar.jpg")
  every_user << emre
  puts "🏳️‍🌈 Shame!🔔 Shame!🔔 Shame!🔔"

  all_instruments.sample((rand(1..6))).each do |instrument|
    UserInstrument.create!(

      proficiency: ['Beginner', 'Intermediate', 'Expert', 'God'].sample,

      user: emre,
      instrument:
    )
  end

  all_genres.sample((rand(1..5))).each do |genre|
    UserGenre.create!(
      user: emre,
      genre:
    )
  end

  all_projects.sample((rand(1..5))).each do |project|
    UserProject.create!(
      user: emre,
      project:,
      admin: [true, false].sample
    )
  end
puts "Creating new users..."
  20.times do
    artist = User.create!(
      name: Faker::Name.unique.name,
      email: "#{Faker::Music.unique.chord}@gmail.com",
      password: '123456',
      age: Faker::Number.between(from: 18, to: 65),
      location: ['Montreal', 'Quebec City', 'Châteauguay', 'Laval', 'Gatineau', 'Longueuil', 'Trois-Rivières'].sample,
      bio: user_bios.shuffle!.pop,
      phone: Faker::PhoneNumber.cell_phone,
      gender: ['male', 'female', 'other'].sample,
      # photo: File.open(user_avatars.sample)
      #instrument_ids: all_instruments.sample(3).map(&:id)
      )

      # artist.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/photo-1471565661762-b9dfae862dbe.jpeg"), filename: "patates.jpg")

      artist.photo.attach(io: File.open(user_avatars.shuffle!.pop), filename: "avatar.jpg")

      # artist.photo.attach(
      #   filename: 'avatar.jpg',
      #   io: URI.open(unsplash_urls.shuffle!.pop)
      # )

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

      all_instruments.sample((rand(1..6))).each do |instrument|
        UserInstrument.create!(

          proficiency: ['Beginner', 'Intermediate', 'Expert', 'God'].sample,

          user: artist,
          instrument:
        )
      end

      all_genres.sample((rand(1..5))).each do |genre|
        UserGenre.create!(
          user: artist,
          genre:
        )
      end

      all_projects.sample((rand(1..5))).each do |project|
        UserProject.create!(
          user: artist,
          project:,
          admin: [true, false].sample
        )
      end

      every_user << artist
    end
  puts "#{User.count} artists created"

puts "Requester is getting created!"
  requester = User.create!(
    name: "Requester",
    email: "requester@banded.com",
    password: "123456",
    location: "Laval"
  )

  requester.photo.attach(
    filename: 'avatar.jpg',
    io: URI.open('https://avatars.githubusercontent.com/u/117036801')
  )

  puts "Requester User is created!"

puts "Receiver is getting created!"
    receiver = User.create!(
    name: "Receiver",
    email: "receiver@banded.com",
    password: "123456",
    location: "Montreal"
  )

  receiver.photo.attach(
    filename: 'avatar.jpg',
    io: URI.open('https://avatars.githubusercontent.com/u/121645038')
  )

  puts "Receiver User is created!"

puts "Connection between requester and receiver is getting created"
  connection = Connection.create!(
    requester:,
    receiver:,
    status: "accepted"
  )
  puts "Connection #{connection.id} is created!"

puts "10 messages are getting created"
    10.times do
    Message.create(
      content: Faker::Quote.famous_last_words,
      connection:,
      sender: [requester, receiver].sample
    )
  end

  puts "Sample Messages created!"

puts "Posts and comments are getting attached to projects"
    all_projects.each do |project|
    10.times do
      post = Post.create(
        content: Faker::Quote.famous_last_words,
        project:,
        sender: [requester, receiver].sample
      )
      10.times do
        Comment.create(
          content: Faker::Quote.famous_last_words,
          post:,
          sender: [requester, receiver].sample
        )
      end
    end
  end

  puts "Sample posts and comments are created!"

puts "Connections for Robert are getting created"
  15.times do
    Connection.create!(
      requester: robert,
      receiver: x = every_user.sample,
      status: "accepted"
    )
    every_user.delete(x)
    puts "Connection #{connection.id} is created!"
  end

  3.times do
    Connection.create!(
      requester: robert,
      receiver: x = every_user.sample,
      status: "pending"
    )
    every_user.delete(x)
    puts "Connection #{connection.id} is created!"
  end

  1.times do
    Connection.create!(
      requester: x = every_user.sample,
      receiver: robert,
      status: "pending"
    )
    every_user.delete(x)
    puts "Connection #{connection.id} is created!"
  end
  puts "Connections for Robert are created"
