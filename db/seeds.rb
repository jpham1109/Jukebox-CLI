# THIS SEED FILE NEEDS TO BE ENTIRELY REPLACED -- I'M LEAVING CODE FOR YOUR REFERENCE ONLY!

# User.destroy_all
# Artist.destroy_all
# Genre.destroy_all
# Album.destroy_all
# Song.destroy_all
# Favorite.destroy_all
# User.reset_pk_sequence
# Artist.reset_pk_sequence
# Genre.reset_pk_sequence
# Album.reset_pk_sequence
# Song.reset_pk_sequence
# Favorite.reset_pk_sequence


########### different ways to write your seeds ############

# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)

#users
bleak = User.create(name: "codingcat", password: "cat")
jamie = User.create(name: "ninjacat", password: "911")

#artists
taylor = Artist.create(name: "Taylor Swift")
red_hot = Artist.create(name: "Red Hot Chili Peppers")
daft = Artist.create(name: "Daft Punk")

#genres
country = Genre.create(name: "Country")
alt = Genre.create(name: "Alternative")
elec = Genre.create(name: "Electronic")

#songs
love_story = Song.create(name: "Love Story", artist_id: taylor.id, length: "3:56", genre_id: country.id, year: 2008)
californication = Song.create(name: "Californication", artist_id: red_hot.id, length: "5:30", genre_id: alt.id, year: 1999)
harder = Song.create(name: "Harder, Better, Faster, Stronger", artist_id: daft.id, length: "3:45", genre_id: elec.id, year: 2001)









# basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)

# # 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
# ## a. by passing an array of hashes:
# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}

# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


 puts "🔥 🔥 seeded 🔥 🔥 "