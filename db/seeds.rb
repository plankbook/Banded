require 'faker'

puts "Database clean-up"
  Notification.delete_all
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
  Notification.delete_all

puts 'Creating instruments'
  instrument_list = ['Piano', 'Guitar', 'Violin', 'Drums', 'Saxophone', 'Trumpet', 'Banjo', 'Accordion']
  10.times do
    Instrument.create!(
      name: instrument_list.shuffle!.pop
    )
  end

  all_instruments = Instrument.all
  all_proficiencies = ['Beginner', 'Intermediate', 'Professional', 'Expert', 'God']
  puts "#{Instrument.count} instruments created"

  all_instruments_except_drums = all_instruments.reject { |instrument| instrument.name == 'Drums' }

puts 'Create genres'
  genre_list = [
    { name: 'Jazz', colour: '#FAD2AD' },
    { name: 'Rock', colour: '#E0D8DD' },
    { name: 'Folk', colour: '#FFD46A' },
    { name: 'Pop', colour: '#FA8E8E' },
    { name: 'RnB', colour: '#AFD1EF' },
    { name: 'Rap', colour: '#B1A9FF' },
    { name: 'Blues', colour: '#6d9eeb' },
    { name: 'Electro', colour: '#c27ba0' }
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
  project_bios = [
    "Introducing 'Harmonic Fusion': A captivating musical journey that blends the richness of classical symphonies with the groove of contemporary beats. Prepare to be enchanted by the seamless harmony of strings and electronics, as we transcend genres and create a truly unique sonic experience.",

    "Welcome to the realm of 'Rhythmic Reverie'! Join me as I unravel the threads of melodies and rhythms, weaving together a tapestry of sounds that will transport you to a world of euphoria. Embrace the fusion of electronic and acoustic elements as we embark on an unforgettable musical odyssey.",

    "Dive into the vibrant universe of 'Sonic Kaleidoscope'! Drawing inspiration from a kaleidoscope's ever-changing patterns, I invite you to explore an eclectic mix of genres, from soulful jazz to pulsating electronic beats. Get ready to have your senses dazzled by a sonic explosion of colors and emotions.",

    "Embark on a sonic adventure with 'Melodic Wanderlust'! As a musical explorer, I take you on a mesmerizing journey through enchanting melodies and exotic rhythms from around the world. Together, we'll traverse uncharted territories and discover the beauty of diverse musical cultures.",

    "Welcome to 'Euphonic Rhapsody' – a symphony of emotions, meticulously crafted to touch your soul. Lose yourself in the intricate melodies, soaring harmonies, and deeply evocative lyrics that form the heart of this musical project. Let the music guide you to a place of pure bliss and profound introspection.",

    "Introducing 'Pulse and Poetry': A spellbinding fusion of pulsating electronic beats and introspective lyrical narratives. Get ready to immerse yourself in a world where every rhythm carries a message and every word breathes life. Let the synergy of music and poetry ignite your imagination and awaken your spirit.",

    "Enter the realm of 'Melodic Alchemy' where sound is transformed into pure magic. Witness the synthesis of diverse musical elements as they blend and evolve, creating something entirely new and captivating. Join me on this alchemical journey as we transmute melodies into gold.",

    "Step into the enchanting world of 'Aural Chronicles' – a musical narrative that weaves tales of love, loss, and triumph. Through captivating melodies and heartfelt lyrics, I invite you to join me on an emotional expedition, where each song unravels a chapter in the book of life. Allow the music to guide you through the pages of our shared experiences.",

    "Experience the hypnotic allure of 'Sonic Phantasmagoria' as we transcend the boundaries of conventional music. Delve into a swirling tapestry of sounds, where ethereal melodies and intricate rhythms merge to create an otherworldly experience. Get ready to lose yourself in this mesmerizing sonic dreamscape.",

    "'Harmony Unleashed' invites you to surrender to the power of music and embrace its transformative energy. From soul-stirring ballads to adrenaline-pumping anthems, this project is a testament to the raw emotion and unbridled passion that lies within every note. Let the harmonies ignite your spirit and set your soul ablaze.",

    "Welcome to the world of 'Rhythmic Visions' – a musical tapestry that blends diverse genres, rhythms, and cultures into a harmonious celebration of sound. Join me as we embark on an auditory voyage, where every beat and melody paints vivid pictures in your mind. Open your eyes, and let the music become your vision.",

    "Introducing 'Melodic Fusion': A sonic laboratory where genres collide and boundaries are shattered. Witness the alchemical process of merging classical elements with contemporary beats, resulting in a symphony of innovation. Prepare to have your perception of music redefined as we explore uncharted sonic territories.",

    "Enter a universe of sonic delights with 'Aural Escapades'! Immerse yourself in a mesmerizing blend of electronic soundscapes, ethereal vocals, and infectious rhythms that will transport you to a world of pure sonic euphoria. Get ready to escape the ordinary and let the music carry you away.",

    "Journey with me into the realm of 'Sonic Serendipity' where chance encounters between melodies and rhythms give birth to musical marvels. Explore a vast spectrum of sonic landscapes, from hauntingly beautiful to irresistibly groovy. Let the serendipitous nature of this project guide you to new musical horizons.",

    "'Melodic Reverie' beckons you to a dreamscape of enchanting melodies and captivating harmonies. Step into a world where music becomes a vessel for emotions, carrying you on a journey of introspection and self-discovery. Surrender to the power of the melodies and let your imagination run wild.",

    "Welcome to 'Rhythmic Reflections' – a collection of songs that mirror the human experience through rhythm and melody. Each composition is a mirror reflecting emotions, stories, and moments of life. Join me as we explore the depths of our shared humanity through the language of music.",

    "Unleash your senses with 'Sonic Awakening' – a project that defies musical conventions and embraces the limitless possibilities of sound. From ethereal melodies to pulsating beats, immerse yourself in a sonic awakening that will invigorate your spirit and ignite your passion for music.",

    "Enter a realm where melodies transcend time and cultures with 'Universal Harmonies'. This project unites musical traditions from around the globe, weaving them into a tapestry of harmonious unity. Let the music bridge the gaps between us and celebrate the beauty of our shared humanity.",

    "Prepare to be captivated by the enchanting melodies and ethereal vocals of 'Celestial Sonatas'. Inspired by the cosmos and the mysteries of the universe, this project takes you on a celestial journey through celestial harmonies. Embrace the celestial symphony and let it transport you to realms beyond imagination.",

    "Step into the world of 'Sonic Odyssey' and embark on a musical adventure of epic proportions. Through soaring melodies, thunderous beats, and emotive lyrics, we'll traverse the highs and lows of the human experience. Join me on this sonic odyssey, where every note tells a story and every song becomes a chapter in our collective narrative."
  ]

  20.times do
    project = Project.create(
      name: Faker::Music.band,
      bio: project_bios.shuffle!.pop
    )
    project.photo.attach(io: File.open(project_banners.shuffle!.pop), filename: "project_banner.jpg")
    all_projects << project
  end


  puts "Projects created!"

user_avatars = Dir.glob(Rails.root.join('app', 'assets', 'images', 'user-avatars', '*.jpeg'))
mtl_drummers_avatars = Dir.glob(Rails.root.join('app', 'assets', 'images', 'mtl-drummers-avatars', '*.jpg'))
  # user_photo = Rails.root('app/assets/images/user-avatars/photo-1471565661762-b9dfae862dbe.jpeg')

every_user = [] # this array will have every user in the database except Chris, Robert, Arnaud, Emre, and the Undesirable Drummer
users_for_chris_projects = [] # this array will have every user in the database except Chris, Robert, Arnaud, Emre, and the Undesirable Drummer, but for the use of creating projects for Chris.
puts 'Undesirable drummer incoming...'
  undesirabledrummer = User.create!(
    name: 'Mathieu Bouchard-Tremblay',
    email: 'mathieu@banded.com',
    password: '123456',
    location: "Montreal",
    age: 32,
    bio: "Concert violinist, fed up with strings, looking for a change. I've recently taken up drums and loving it! Don't miss my soulful rendition of Baby Shark."
  )

  undesirabledrummer.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/undesirabledrummer.jpg"), filename: "avatar.jpg")

  UserInstrument.create!(
    proficiency: 'Beginner',
    user: undesirabledrummer,
    instrument: Instrument.find_by(name: 'Drums')
  )

  UserInstrument.create!(
    proficiency: 'God',
    user: undesirabledrummer,
    instrument: Instrument.find_by(name: 'Violin')
  )

  UserInstrument.create!(
    proficiency: 'Expert',
    user: undesirabledrummer,
    instrument: Instrument.find_by(name: 'Guitar')
  )

  puts 'Genres for Mathieu the Undesirable Drummer are getting created'
  UserGenre.create!(
    user: undesirabledrummer,
    genre: Genre.find_by(name: 'Pop')
  )

  UserGenre.create!(
    user: undesirabledrummer,
    genre: Genre.find_by(name: 'Rock')
  )

  UserGenre.create!(
    user: undesirabledrummer,
    genre: Genre.find_by(name: 'Folk')
  )

  UserGenre.create!(
    user: undesirabledrummer,
    genre: Genre.find_by(name: 'Electro')
  )

  UserGenre.create!(
    user: undesirabledrummer,
    genre: Genre.find_by(name: 'RnB')
  )

  puts 'Mathieu the Undesirable Drummer now plays the drums very badly.'

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

  # all_instruments.sample((rand(1..6))).each do |instrument|
  #   UserInstrument.create!(

  #     proficiency: all_proficiencies.sample,

  #     user: arnaud,
  #     instrument:
  #   )
  # end

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
  # all_instruments.sample((rand(1..6))).each do |instrument|
  #   UserInstrument.create!(

  #     proficiency: all_proficiencies.sample,

  #     user: robert,
  #     instrument:
  #   )
  # end

  # all_genres.sample((rand(1..5))).each do |genre|
  #   UserGenre.create!(
  #     user: robert,
  #     genre:
  #   )
  # end

  all_projects.sample((rand(1..5))).each do |project|
    UserProject.create!(
      user: robert,
      project:,
      admin: [true, false].sample
    )
  end

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

  # all_instruments.sample((rand(1..6))).each do |instrument|
  #   UserInstrument.create!(
  #     proficiency: all_proficiencies.sample,
  #     user: chris,
  #     instrument:
  #   )
  # end

  # all_projects.sample(6).each do |project|
  #   UserProject.create!(
  #     user: chris,
  #     project:,
  #     admin: [true, false].sample
  #   )
  # end

  # project = Project.create(
  #   name: Faker::Music.band,
  #     bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

  #   project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

    # UserProject.create!(
    #   user: chris,
    #   project:,
    #   admin: [true, false].sample
    # )


  puts "🍁 Όταν λείπει η γάτα, χορεύουν τα ποντίκια"

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

  puts "🏳️‍🌈 Shame!🔔 Shame!🔔 Shame!🔔"

  # all_instruments.sample((rand(1..6))).each do |instrument|
  #   UserInstrument.create!(

  #     proficiency: all_proficiencies.sample,

  #     user: emre,
  #     instrument:
  #   )
  # end

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

puts 'Techtrek musical project'

  puts "Latoya!"
    latoya = User.create!(
      name: 'Latoya Alford',
      email: 'latoya@banded.com',
      password: '123456',
      location: "Montreal",
      age: 31,
      bio: "Currently in cybersecurity, and learning to code because I love to build and create things. I'm currently working towards establishing my own tech startup!"
    )

    latoya.photo.attach(io: File.open("#{Rails.root}/app/assets/images/techtrek/latoya.png"), filename: "avatar.jpg")
  
    all_instruments.sample((rand(1..4))).each do |instrument|
      UserInstrument.create!(
        proficiency: all_proficiencies.sample,
        user: latoya,
        instrument:
      )
    end

    UserInstrument.create!(
      proficiency: all_proficiencies.sample,
      user: latoya,
      instrument: Instrument.find_by(name: 'Drums')
    )

    all_genres.sample((rand(1..5))).each do |genre|
      UserGenre.create!(
        user: latoya,
        genre:
      )
    end

  puts "Andrew!"
    andrew = User.create!(
      name: 'Andrew Phan',
      email: 'andrew@banded.com',
      password: '123456',
      location: "Montreal",
      age: 31,
      bio: "Hi, I currently work as a Supply Specialist at Samsung Ads. I previously took a coding classes during university and I always had an interest in coding. Therefore, I am taking a bootcamp to further my skills and hopefully after the bootcamp, I can work as a developer."
    )

    andrew.photo.attach(io: File.open("#{Rails.root}/app/assets/images/techtrek/andrew.jpg"), filename: "avatar.jpg")
  
    all_instruments.sample((rand(1..4))).each do |instrument|
      UserInstrument.create!(
        proficiency: all_proficiencies.sample,
        user: andrew,
        instrument:
      )
    end

    UserInstrument.create!(
      proficiency: all_proficiencies.sample,
      user: andrew,
      instrument: Instrument.find_by(name: 'Drums')
    )

    all_genres.sample((rand(1..5))).each do |genre|
      UserGenre.create!(
        user: andrew,
        genre:
      )
    end

  puts "Bertrand!"
    bertrand = User.create!(
      name: 'Bertrand Phan',
      email: 'bertrand@banded.com',
      password: '123456',
      location: "Montreal",
      age: 34,
      bio: "Hi, I currently work as a Supply Specialist at Samsung Ads. I previously took a coding classes during university and I always had an interest in coding. Therefore, I am taking a bootcamp to further my skills and hopefully after the bootcamp, I can work as a developer."
    )

    bertrand.photo.attach(io: File.open("#{Rails.root}/app/assets/images/techtrek/bertrand.png"), filename: "avatar.jpg")
  
    all_instruments.sample((rand(1..4))).each do |instrument|
      UserInstrument.create!(
        proficiency: all_proficiencies.sample,
        user: bertrand,
        instrument:
      )
    end

    UserInstrument.create!(
      proficiency: all_proficiencies.sample,
      user: bertrand,
      instrument: Instrument.find_by(name: 'Drums')
    )

    all_genres.sample((rand(1..5))).each do |genre|
      UserGenre.create!(
        user: bertrand,
        genre:
      )
    end

  puts "Kameron!"
    kameron = User.create!(
      name: 'Kameron Phan',
      email: 'kameron@banded.com',
      password: '123456',
      location: "Montreal",
      age: 25,
      bio: "Previously in customer support in finance, but when I was laid off, I began to search for a different career path. I was looking into coding for a while and was recommended by some friends to look into le wagon. I plan on becoming a full stack dev after completing le wagon and hope to create my own applications one day!"
    )

    kameron.photo.attach(io: File.open("#{Rails.root}/app/assets/images/techtrek/kameron.jpg"), filename: "avatar.jpg")
  
    all_instruments.sample((rand(1..4))).each do |instrument|
      UserInstrument.create!(
        proficiency: all_proficiencies.sample,
        user: kameron,
        instrument:
      )
    end

    UserInstrument.create!(
      proficiency: all_proficiencies.sample,
      user: kameron,
      instrument: Instrument.find_by(name: 'Drums')
    )

    all_genres.sample((rand(1..5))).each do |genre|
      UserGenre.create!(
        user: kameron,
        genre:
      )
    end

  puts "Peter!"
    peter = User.create!(
      name: 'Peter McClintock',
      email: 'peter@banded.com',
      password: '123456',
      location: "Montreal",
      age: 34,
      bio: "I like to see the world differently and I am not always content in our current reality. I believe design and innovation can create new realities that alter our state and our world."
    )

    peter.photo.attach(io: File.open("#{Rails.root}/app/assets/images/techtrek/peter.jpg"), filename: "avatar.jpg")
  
    all_instruments.sample((rand(1..4))).each do |instrument|
      UserInstrument.create!(
        proficiency: all_proficiencies.sample,
        user: peter,
        instrument:
      )
    end

    UserInstrument.create!(
      proficiency: all_proficiencies.sample,
      user: peter,
      instrument: Instrument.find_by(name: 'Drums')
    )

    all_genres.sample((rand(1..5))).each do |genre|
      UserGenre.create!(
        user: peter,
        genre:
      )
    end

  techtrek = Project.create(
    name: 'TechTrek Glee Club',
    bio: "We got together to create an app that will connect tech students with mentors, but we couldn't stop jamming all the time. Now we're putting together a song and we need a fierce glockenspieler to join us."
  )
  
  techtrek_photo = Rails.root.join('app', 'assets', 'images', 'techtrek.jpg')
  techtrek.photo.attach(io: File.open(techtrek_photo), filename: "project_banner.jpg")

  UserProject.create(
    project: techtrek,
    user: andrew
  )

  UserProject.create(
    project: techtrek,
    user: bertrand
  )

  UserProject.create(
    project: techtrek,
    user: kameron
  )

  UserProject.create(
    project: techtrek,
    user: latoya
  )

  UserProject.create(
    project: techtrek,
    user: peter
  )


puts "Creating new users..."
  20.times do
    artist = User.create!(
      name: Faker::Name.unique.name,
      email: "#{Faker::Music.unique.chord}@gmail.com",
      password: '123456',
      age: Faker::Number.between(from: 18, to: 65),
      location: ['Montreal', 'Quebec City', 'Toronto', 'Laval', 'Vancouver', 'Longueuil', 'Calgary'].sample,
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

          proficiency: all_proficiencies.sample,

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
      users_for_chris_projects << artist
    end
  puts "#{User.count} artists created"

# puts "Requester is getting created!"
  #   requester = User.create!(
  #     name: "Requester",
  #     email: "requester@banded.com",
  #     password: "123456",
  #     location: "Laval"
  #   )

  #   requester.photo.attach(
  #     filename: 'avatar.jpg',
  #     io: URI.open('https://avatars.githubusercontent.com/u/117036801')
  #   )

  #   puts "Requester User is created!"

  # puts "Receiver is getting created!"
  #     receiver = User.create!(
  #     name: "Receiver",
  #     email: "receiver@banded.com",
  #     password: "123456",
  #     location: "Montreal"
  #   )

  #   receiver.photo.attach(
  #     filename: 'avatar.jpg',
  #     io: URI.open('https://avatars.githubusercontent.com/u/121645038')
  #   )

  #   puts "Receiver User is created!"

  # puts "Connection between requester and receiver is getting created"
  #   connection = Connection.create!(
  #     requester:,
  #     receiver:,
  #     status: "accepted"
  #   )
  #   puts "Connection #{connection.id} is created!"

  # puts "10 messages are getting created"
  #     10.times do
  #     Message.create(
  #       content: Faker::Quote.famous_last_words,
  #       connection:,
  #       sender: [requester, receiver].sample
  #     )
  #   end

  #   puts "Sample Messages created!"

  # puts "Posts and comments are getting attached to projects"
  #   all_projects.each do |project|
  #     10.times do
  #       post = Post.create(
  #         content: Faker::Quote.famous_last_words,
  #         project:,
  #         sender: [requester, receiver].sample
  #       )
  #       10.times do
  #         Comment.create(
  #           content: Faker::Quote.famous_last_words,
  #           post:,
  #           sender: [requester, receiver].sample
  #         )
  #       end
  #     end
  #   end
  #   puts "Sample posts and comments are created!"

puts 'Genres for Robert are getting created'
  UserGenre.create!(
    user: robert,
    genre: Genre.find_by(name: 'Blues')
  )

  UserGenre.create!(
    user: robert,
    genre: Genre.find_by(name: 'Jazz')
  )

  puts 'Robert now has 2 genre pills: jazz and blues'
puts 'Instruments for Robert are getting created'
  UserInstrument.create!(
    proficiency: 'God',
    user: robert,
    instrument: Instrument.find_by(name: 'Drums')
  )

  UserInstrument.create!(
    proficiency: 'Professional',
    user: robert,
    instrument: Instrument.find_by(name: 'Guitar')
  )

  # UserInstrument.create!(
  #   proficiency: all_proficiencies.sample,
  #   user: robert,
  #   instrument: Instrument.find_by(name: 'Violin')
  # )

  # UserInstrument.create!(
  #   proficiency: all_proficiencies.sample,
  #   user: robert,
  #   instrument: Instrument.find_by(name: 'Banjo')
  # )


  puts 'Robert now plays at least 5 instruments, one of which is drums.'

puts 'Genres for Chris are getting created'
  UserGenre.create!(
    user: chris,
    genre: Genre.find_by(name: 'Blues')
  )

  UserGenre.create!(
    user: chris,
    genre: Genre.find_by(name: 'Jazz')
  )

  UserGenre.create!(
    user: chris,
    genre: Genre.find_by(name: 'Rock')
  )

  UserGenre.create!(
    user: chris,
    genre: Genre.find_by(name: 'Folk')
  )

  UserGenre.create!(
    user: chris,
    genre: Genre.find_by(name: 'Pop')
  )

  UserGenre.create!(
    user: chris,
    genre: Genre.find_by(name: 'Electro')
  )

  puts 'Chris can now pop at least 6 pills... OF GENRES'
puts 'Instruments for Chris are getting created'
  UserInstrument.create!(
    proficiency: 'God',
    user: chris,
    instrument: Instrument.find_by(name: 'Accordion')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: chris,
    instrument: Instrument.find_by(name: 'Guitar')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: chris,
    instrument: Instrument.find_by(name: 'Violin')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: chris,
    instrument: Instrument.find_by(name: 'Banjo')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: chris,
    instrument: Instrument.find_by(name: 'Piano')
  )

  puts 'Chris now plays 5 instruments, none of which is drums.'

puts "Connections for Chris are getting created"
  Connection.create!(
    requester: chris,
    receiver: emre,
    status: "accepted"
  )
  puts "Chris is now connected to Emre."

puts "Creating first Notification for Chris"
ConnectionNotification.with(connection: Connection.last, read_at: Time.now).deliver_later(Connection.last.requester)
Notification.last.update(read_at: Time.now)

  Connection.create!(
    requester: chris,
    receiver: arnaud,
    status: "accepted"
  )
  puts "Chris is now connected to Arnaud."

  15.times do
    connection = Connection.create!(
      requester: chris,
      receiver: x = every_user.sample,
      status: "accepted"
    )
    every_user.delete(x)
    puts "Connection #{connection.id} is created!"
  end

  3.times do
    connection = Connection.create!(
      requester: chris,
      receiver: x = every_user.sample,
      status: "pending"
    )
    every_user.delete(x)
    puts "Connection #{connection.id} is created!"
  end

  1.times do
    connection = Connection.create!(
      requester: x = every_user.sample,
      receiver: chris,
      status: "pending"
    )
    every_user.delete(x)
    puts "Connection #{connection.id} is created!"
  end
  puts "Random connections for Chris are created. He's also connected to Arnaud and Emre. But not Robert :/"

puts "Projects for Chris are getting created"
  project_banners_chris = Dir.glob(Rails.root.join('app', 'assets', 'images', 'project-banners-chris', '*.jpg'))

  puts "Fluctuating Manpower"

    project = Project.create(
      name: 'Fluctuating Manpower',
      bio: "We're three artists and we've been putting together a song. The melody is solid but the lyrics need major rework, but we still have time before we focus on that. We currently need a fast and steady drummer who will have to provide a confident beat for the song to work, so don't hesitate to connect if you're interested! Saxophone already provides a great solo - there's a major possibility sax + drums might overshadow the piano, but we will deal with this during mix."
      )

      project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

      UserProject.create(
        project: ,
        user: chris
      )

      UserProject.create(
        project: ,
        user: arnaud
      )

      UserProject.create(
        project: ,
        user: emre
      )

    puts "Fluctuating Manpower created with Arnaud and Emre. Rob will be added to this project in the demo."

    puts "Posts and comments are getting created for Fluctuating Manpower"
      10.times do
        post = Post.create(
          content: Faker::Quote.famous_last_words,
          project:,
          sender: [chris, arnaud, emre].sample
        )
        10.times do
          Comment.create(
            content: Faker::Quote.famous_last_words,
            post:,
            sender: [chris, arnaud, emre].sample
          )
        end
      end
      puts "Posts and comments are created for Fluctuating Manpower"

  puts "Other projects for Chris"
    # project_bios_chris = []
    UserProject.create(
      project: techtrek,
      user: chris
    )

    project = Project.create(
      name: 'Sonic Fusion',
      bio: "Attention Montreal Musicians! Join Sonic Fusion, a cutting-edge collaborative project based in Montreal. We're seeking talented musicians to push the boundaries of sonic exploration. Together, we'll create a mesmerizing fusion of genres, blending diverse influences into a unique sonic tapestry. If you're a visionary instrumentalist, soulful vocalist, or innovative sound designer, this is your chance to be part of something extraordinary. Let's break free from conventions, ignite creativity, and make a mark on the Montreal music scene. Join Sonic Fusion today and embark on an exhilarating musical journey like no other."
      )

      project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

      users_for_chris_projects.sample((rand(1..3))).each do |user|
        UserProject.create(
          project: ,
          user:
        )
      end

      UserProject.create(
          project: ,
          user: chris
        )

    project = Project.create(
      name: 'Rhythmic Vortex',
      bio: "Attention Montreal Musicians! Step into the Rhythmic Vortex, a captivating musical project calling for talented artists. Based in Montreal, we're on a quest to push rhythmic boundaries and unleash sonic magic. Whether you're a groove maestro, beat wizard, or rhythm virtuoso, join us to explore exhilarating polyrhythms and mind-bending time signatures. Together, we'll create a pulsating sonic landscape that mesmerizes audiences and challenges conventional norms. If you're ready to infuse your passion into a collaborative project that will redefine the rhythmic landscape, join Rhythmic Vortex today and let's make our mark on the Montreal music scene."
      )

      project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

      users_for_chris_projects.sample((rand(1..3))).each do |user|
        UserProject.create(
          project: ,
          user:
        )
      end

      UserProject.create(
          project: ,
          user: chris
        )

    project = Project.create(
      name: 'Harmony Fusion',
      bio: "Join Harmony Fusion, an innovative musical project that seeks to bridge diverse harmonies in Montreal's vibrant music community. We're looking for skilled musicians who yearn to blend genres, break musical barriers, and create enchanting compositions. Whether you're a master of melodies, a vocal prodigy, or a versatile instrumentalist, let's come together to craft a sonic journey that transcends conventions. Join Harmony Fusion today and let your musical voice harmonize with others, leaving a resounding impact on the Montreal music scene."
      )

      project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

      users_for_chris_projects.sample((rand(1..3))).each do |user|
        UserProject.create(
          project: ,
          user:
        )
      end

      UserProject.create(
          project: ,
          user: chris
        )

    project = Project.create(
      name: 'Melodic Nexus',
      bio: "Calling all Montreal Musicians! Unlock your melodic potential and embark on a transformative musical journey with Melodic Nexus. We're assembling a collective of visionary artists who want to weave captivating melodies and explore the realm of harmonious possibilities. If you're a master of strings, a maestro of keys, or a vocal luminary, join us to break free from conventional structures and create something extraordinary. Together, we'll create a sonic nexus that resonates with audiences, pushing boundaries and redefining the melodic landscape. Join Melodic Nexus today and let your melodies shape the Montreal music scene."
      )

      project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

      users_for_chris_projects.sample((rand(1..3))).each do |user|
        UserProject.create(
          project: ,
          user:
        )
      end

      UserProject.create(
          project: ,
          user: chris
        )

    project = Project.create(
      name: 'Sonic Alchemy',
      bio: "Dive into the world of Sonic Alchemy, an electrifying musical project seeking talented artists from diverse backgrounds. Based in Montreal, we're on a quest to transform sounds and create aural magic. Whether you're a sonic architect, rhythm explorer, or experimentalist, join us to push the boundaries of sonic manipulation and alchemize diverse elements into something extraordinary. Together, we'll sculpt immersive sonic landscapes that transport listeners to uncharted realms. Join Sonic Alchemy today and let's embark on a transformative sonic journey that leaves an indelible mark on the Montreal music scene."
      )

      project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

      users_for_chris_projects.sample((rand(1..3))).each do |user|
        UserProject.create(
          project: ,
          user:
        )
      end

      UserProject.create(
          project: ,
          user: chris
        )


    project = Project.create(
    name: 'Groove Fusion Collective',
    bio: "Montreal's grooviest musicians, unite! Join the Groove Fusion Collective, a musical project dedicated to harnessing the infectious power of rhythm. We're on the lookout for exceptional instrumentalists, groove masters, and rhythm aficionados to create a groove revolution. Together, we'll meld funky basslines, soulful chords, and irresistible beats, crafting a sonic force that will ignite dance floors and leave audiences in awe. If you're ready to make bodies move, break musical boundaries, and become part of Montreal's groove movement, join the Groove Fusion Collective today and let's create irresistible rhythms that shake the city."
    )

    project.photo.attach(io: File.open(project_banners_chris.shuffle!.pop), filename: "project_banner.jpg")

    # UserProject.create(
    #   user: users_for_chris_projects.sample((rand(1..3))),
    #   project:
    # )

    users_for_chris_projects.sample((rand(1..3))).each do |user|
      UserProject.create(
        project: ,
        user:
      )
    end

    UserProject.create(
        project: ,
        user: chris
      )


puts 'Instruments for Arnaud are getting created'
  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: arnaud,
    instrument: Instrument.find_by(name: 'Violin')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: arnaud,
    instrument: Instrument.find_by(name: 'Banjo')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: arnaud,
    instrument: Instrument.find_by(name: 'Piano')
  )

  puts 'Arnaud now plays 3 instruments, none of which is drums.'

puts 'Instruments for Emre are getting created'
  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: emre,
    instrument: Instrument.find_by(name: 'Saxophone')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: emre,
    instrument: Instrument.find_by(name: 'Piano')
  )

  UserInstrument.create!(
    proficiency: all_proficiencies.sample,
    user: emre,
    instrument: Instrument.find_by(name: 'Trumpet')
  )

  puts 'Emre now plays 3 instruments, none of which is drums.'



puts "Creating user bios for random Montreal drummers"
  montreal_drummer_bios = [
  "I'm a passionate drummer based in Montreal, bringing the rhythm to the vibrant music scene of this city. With years of experience, my beats are guaranteed to get your feet tapping and your body moving. Let's groove together!",

  "Greetings, Montreal music lovers! I'm a skilled drummer residing in this beautiful city, ready to set the stage on fire with my impeccable rhythm. From jazz to rock and everything in between, I've mastered diverse genres, delivering unforgettable performances that will leave you wanting more.",

  "Attention, Montreal! Get ready to be mesmerized by the beats of a dynamic drummer in your midst. With my exceptional drumming skills, I effortlessly navigate various musical styles, creating an electrifying atmosphere wherever I play. Let's create unforgettable moments together!",

  "Calling all Montreal music enthusiasts! I'm a versatile drummer, well-versed in a multitude of genres, and I'm here to bring the groove to your events. Whether it's jazz, funk, or even experimental sounds, my drumming prowess will leave you spellbound. Get ready to embark on a rhythmic journey!",

  "Drumroll, please! I'm a Montreal-based drummer with a flair for creating captivating rhythms that transport audiences to another dimension. With my deep understanding of diverse musical genres, I bring a unique touch to every performance, infusing energy and soul into each beat.",

  "Hello, Montreal music scene! As a seasoned drummer, I'm thrilled to be a part of this thriving community. My rhythmic expertise spans across various genres, allowing me to adapt and excel in any musical setting. Brace yourself for an unforgettable percussion experience!",

  "Attention all music lovers in Montreal! I'm a skilled drummer who has dedicated countless hours perfecting my craft. Whether it's jazz, Latin, or even fusion, I bring a technical finesse and creative flair to every performance, ensuring a memorable and groove-filled experience for all.",

  "Drum enthusiasts of Montreal, unite! I'm an accomplished percussionist, honing my skills behind the kit for years. With an infectious passion for rhythm, I seamlessly blend different styles and create intricate beats that elevate any musical composition. Let's make some magic together!",

  "I'm a Montreal drummer extraordinaire, ready to captivate audiences with my rhythmic prowess. Whether it's in a small jazz club or a grand concert hall, my drumming finesse shines through, leaving listeners in awe of the intricate patterns and dynamic energy I bring to the stage.",

  "Hey, Montreal music aficionados! I'm a highly skilled drummer, and my beats are sure to make your heart skip a beat. With a diverse background in various genres, I possess the versatility to adapt to any musical project, delivering solid rhythms that will make you move and groove in no time. Let's create musical magic together!"
  ]

puts "Creating new drummers in Montreal..."
  10.times do
    artist = User.create!(
      name: Faker::Name.unique.name,
      email: "#{Faker::Music.unique.chord}@gmail.com",
      password: '123456',
      age: Faker::Number.between(from: 18, to: 65),
      location: 'Montreal',
      bio: montreal_drummer_bios.shuffle!.pop,
      phone: Faker::PhoneNumber.cell_phone,
      gender: ['male', 'female', 'other'].sample,
      # photo: File.open(user_avatars.sample)
      #instrument_ids: all_instruments.sample(3).map(&:id)
      )

      # artist.photo.attach(io: File.open("#{Rails.root}/app/assets/images/user-avatars/photo-1471565661762-b9dfae862dbe.jpeg"), filename: "patates.jpg")

      artist.photo.attach(io: File.open(mtl_drummers_avatars.shuffle!.pop), filename: "avatar.jpg")

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

      UserInstrument.create!(
        proficiency: all_proficiencies.sample,
        user: artist,
        instrument: Instrument.find_by(name: 'Drums')
        )

      all_instruments_except_drums.sample((rand(1..3))).each do |instrument|
        UserInstrument.create!(

          proficiency: all_proficiencies.sample,

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

      # every_user << artist
    end
  puts "#{User.count} artists created"

