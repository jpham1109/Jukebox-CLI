class Jukebox
  attr_reader :prompt
  attr_accessor :user, :password
  
  def initialize
    #config this out later
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
    prompt.select("Sign in or Sign up") do |option|
      option.choice "Sign in", -> {sign_in_helper}
      option.choice "Sign up", -> {sign_up_helper}
      option.choice "Exit", -> {exit_helper}
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
    #banner?
    prompt.select("Browse or view list") do |option|
      option.choice "Browse categories", -> {categories_helper}
      option.choice "View favorites", -> {favorites_helper}
      option.choice "Exit", -> {exit_helper}
    end
  end

  def main_menu_new_user
    system 'clear'
    puts "Welcome, #{user.name}!"
    #banner?
    prompt.select("Browse or view list") do |option|
      option.choice "Browse categories", -> {categories_helper}
      option.choice "Exit", -> {exit_helper}
    end
  end

  def categories_helper
    system 'clear'
    prompt.select("Browse") do |option|
      option.choice "Genres", -> {genres_helper}
      option.choice "Artists", -> {artists_helper}
      option.choice "Albums", -> {albums_helper}
      option.choice "Songs", -> {songs_helper}
      option.choice "Main menu", -> {main_menu_welcome_back}
    end
  end 

  def genres_helper
    system 'clear'
    chosen_genre = prompt.select("Which genre would you like?", Genre.all_genres)
    songs_by_genre = Song.all.where(genre_id: chosen_genre)
    songs = songs_by_genre.map{|song| {song.name => song.id}}
    chosen_song = prompt.select("Which song would you like?", songs)
    prompt.select("Please select an option") do |option|
      option.choice "Browse categories", -> {categories_helper}
      option.choice "View favorites", -> {favorites_helper}
      option.choice "Exit", -> {exit_helper}
  end 

  def artists_helper
    system 'clear'
    chosen_artist = prompt.select("Which artist would you like?", Artist.all_artists)
    songs_by_artist = Song.all.where(artist_id: chosen_artist)
    songs = songs_by_artist.map{|song| {song.name => song.id}}
    chosen_song = prompt.select("Which song would you like?", songs) 
  end 

  def songs_helper
    system 'clear'
    chosen_song = prompt.select("Which song would you like?", Song.all_songs)
  end 

  def view_favorites
    Favorite.all.select{|favorite| favorite.user_id == user.id}
  end

  def exit_helper
    puts "See you next time!"
    sleep(2)
    system 'clear'
    exit
  end
end
