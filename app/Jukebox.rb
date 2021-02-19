class Jukebox
  attr_reader :prompt
  attr_accessor :user, :password
  
  def initialize
    @prompt = TTY::Prompt.new
  end
  
  def run
      welcome
  end
  
  def welcome
    system 'clear'
    #welcome_music
    sleep(1)
    puts "Welcome to...".colorize(:magenta)
    sleep(1)
    banner
    sleep(1)
    prompt.select("Sign in or Sign up") do |menu|
      menu.choice "Sign in", -> {sign_in_helper}
      menu.choice "Sign up", -> {sign_up_helper}
      menu.choice "Exit", -> {exit_helper}
    end
  end

  def banner
    puts "
    ████████╗██╗░░██╗███████╗  ░░░░░██╗██╗░░░██╗██╗░░██╗███████╗██████╗░░█████╗░██╗░░██╗
    ╚══██╔══╝██║░░██║██╔════╝  ░░░░░██║██║░░░██║██║░██╔╝██╔════╝██╔══██╗██╔══██╗╚██╗██╔╝
    ░░░██║░░░███████║█████╗░░  ░░░░░██║██║░░░██║█████═╝░█████╗░░██████╦╝██║░░██║░╚███╔╝░
    ░░░██║░░░██╔══██║██╔══╝░░  ██╗░░██║██║░░░██║██╔═██╗░██╔══╝░░██╔══██╗██║░░██║░██╔██╗░
    ░░░██║░░░██║░░██║███████╗  ╚█████╔╝╚██████╔╝██║░╚██╗███████╗██████╦╝╚█████╔╝██╔╝╚██╗
    ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ░╚════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝
    ".colorize(:magenta)
  end
  
  def sign_in_helper
    system 'clear'
    name = prompt.ask("Enter your username:")
    if self.user = User.find_by(name: name)
      puts "Welcome back #{user.name}!"
      main_menu_welcome_back
    else
      puts "Username not found. Please create a username."
      sleep(2)
      sign_up_helper
    end
  end 

  def sign_up_helper
    system 'clear'
    name = prompt.ask("Please enter a username:")
    while User.find_by(name: name)
      puts "This username already exists. Please enter a new username."
      sleep(2)
      sign_up_helper
    end
    password = prompt.ask("Please enter a password:")
    self.user = User.create(name: name, password: password)
    sleep(0.5)
    main_menu_new_user
  end 

  def main_menu_welcome_back
    system 'clear'
    puts "Welcome back, #{user.name}!"
    prompt.select("Browse or view list") do |menu|
      menu.choice "Browse categories", -> {categories_helper}
      menu.choice "View favorites", -> {favorites_helper(user)}
      menu.choice "Exit", -> {exit_helper}
    end
  end

  def main_menu_new_user
    system 'clear'
    puts "Welcome, #{user.name}!"
    prompt.select("Browse or view list") do |menu|
      menu.choice "Browse categories", -> {categories_helper}
      menu.choice "Delete user", -> {delete_user}
      menu.choice "Exit", -> {exit_helper}
    end
  end

  def categories_helper
    system 'clear'
    prompt.select("Browse") do |menu|
      menu.choice "Genres", -> {genres_helper}
      menu.choice "Artists", -> {artists_helper}
      menu.choice "Songs", -> {songs_helper}
      menu.choice "Main menu", -> {main_menu_welcome_back}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def genres_helper
    system 'clear'
    genres = Genre.all_genres
    chosen_genre = prompt.select("Which genre would you like?", genres) 
    prompt.select("Would you like to..") do |menu|
      menu.choice "View songs", -> {songs_by_genre(chosen_genre)}
      menu.choice "Go back", -> {genres_helper}
      menu.choice "Categories", -> {categories_helper}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def songs_by_genre(chosen_genre)
    system 'clear'
    songs_by_genre = Song.all.where(genre_id: chosen_genre)
    songs = songs_by_genre.map{|song| {song.name => song.id}}
    chosen_song = prompt.select("Which song would you like?", songs)
    puts song = Song.find(chosen_song).to_s
    prompt.select("Would you like to..") do |menu|
      menu.choice "Play song", -> {play_song_by_genre(chosen_song, chosen_genre)}
      menu.choice "Add to favorites", -> {add_favorite(user.id, chosen_song)}
      menu.choice "Go back", -> {genres_helper}
      menu.choice "Categories", -> {categories_helper}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def artists_helper
    system 'clear'
    artists = Artist.all_artists
    chosen_artist = prompt.select("Which artist would you like?", artists) 
    prompt.select("Would you like to..") do |menu|
      menu.choice "View songs", -> {songs_by_artist(chosen_artist)}
      menu.choice "Go back", -> {artist_helper}
      menu.choice "Categories", -> {categories_helper}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def songs_by_artist(chosen_artist)
    system 'clear'
    songs_by_artist = Song.all.where(artist_id: chosen_artist)
    songs = songs_by_artist.map{|song| {song.name => song.id}}
    chosen_song = prompt.select("Which song would you like?", songs)
    puts song = Song.find(chosen_song).to_s
    prompt.select("Would you like to..") do |menu|
      menu.choice "Play song", -> {play_song_by_artist(chosen_song, chosen_artist)}
      menu.choice "Add to favorites", -> {add_favorite(user.id, chosen_song)}
      menu.choice "Go back", -> {genres_helper}
      menu.choice "Categories", -> {categories_helper}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def songs_helper
    system 'clear'
    chosen_song = prompt.select("Which song would you like?", Song.all_songs)
    prompt.select("Would you like to..") do |menu|
      menu.choice "Play song", -> {play_song(chosen_song)}
      menu.choice "Add to favorites", -> {add_favorite(user.id, chosen_song)}
      menu.choice "Go back", -> {genres_helper}
      menu.choice "Categories", -> {categories_helper}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def play_song_by_genre(chosen_song, chosen_genre)
    url = Song.find(chosen_song).url
    Launchy.open "#{url}"
    songs_by_genre(chosen_genre)
  end

  def play_song_by_artist(chosen_song, chosen_artist)
    url = Song.find(chosen_song).url
    Launchy.open "#{url}"
    songs_by_artist(chosen_artist)
  end

  def play_song(chosen_song)
  url = Song.find(chosen_song).url
  Launchy.open "#{url}"
   songs_helper
  end

  def add_favorite(user_id, song_id)
    if Favorite.find_by(user_id: user_id, song_id: song_id)
      puts "This song is already in your favorites"
    else
    Favorite.create(user_id: user_id, song_id: song_id)
    puts "Added to favorites!"
    end
      sleep(1)
      favorites_helper(user)
  end 

  def favorites_helper(user)
    system 'clear'
    user_favorites = Favorite.where(user_id: user.id)
    fav_songs = user_favorites.map{|fav| fav.song.name}
    # fav_songs = user_favorites.map{|favorite| {favorite.song.name => favorite.id}}
    puts "Here are your favorites:"
    puts fav_songs
    prompt.select("Choose an option") do |menu|
      menu.choice "Remove a song", -> {remove_a_favorite(fav_songs, user_favorites )}
      menu.choice "Delete all favorite", -> {delete_all_favorites(user_favorites)}
      menu.choice "All songs", -> {songs_helper}
      menu.choice "Main menu", -> {main_menu_welcome_back}
      menu.choice "Exit", -> {exit_helper}
    end
  end 

  def remove_a_favorite(fav_songs, user_favorites)
    system 'clear'
    chosen_favorite = prompt.select("Select a song to remove from favorites", fav_songs)
    delete = user_favorites.find{|favorite| favorite.song.name == chosen_favorite}
    delete.destroy
    fav_songs.delete(chosen_favorite)
    puts "Now you're favorites are #{fav_songs}"
    favorites_helper(user)
  end

  def delete_all_favorites(user_favorites)
    system 'clear'
    user_favorites.destroy_all
  end 

  def delete_user
    system 'clear'
    current_user = User.find(self.user.id)
    current_user.delete
    puts "User deleted."
    sleep(2)
    welcome
  end

  def exit_helper
    system 'clear'
    puts "See you next time!"
    sleep(2)
    system 'clear'
    exit
  end
end

