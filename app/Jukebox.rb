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
    banner #set this up
    sleep(1)
    prompt.select("Sign in or Sign up") do |option|
      option.choice "Sign in", -> {sign_in_helper}
      option.choice "Sign up", -> {sign_up_helper}
      option.choice "Exit", -> {exit_helper}
    end
  end

  def banner
    puts "
    ████████ ██   ██ ███████          ██ ██    ██ ██   ██ ███████ ██████   ██████  ██   ██ 
       ██    ██   ██ ██               ██ ██    ██ ██  ██  ██      ██   ██ ██    ██  ██ ██  
       ██    ███████ █████            ██ ██    ██ █████   █████   ██████  ██    ██   ███   
       ██    ██   ██ ██          ██   ██ ██    ██ ██  ██  ██      ██   ██ ██    ██  ██ ██  
       ██    ██   ██ ███████      █████   ██████  ██   ██ ███████ ██████   ██████  ██   ██                                                                                                  
    ".colorize(:magenta)
  end
  
  def sign_in_helper
    system 'clear'
    name = prompt.ask("Enter your username:")
    if self.user = User.find_by(name: name)
      puts "Welcome back #{user.name}!"
      main_menu_welcome_back
    else
      puts "username not found"
      sign_up_helper
    end
  end 

  def sign_up_helper
    system 'clear'
    name = prompt.ask("What would you like your username to be?")
    while User.find_by(name: name)
      puts "This username already exists. Please enter a new username."
      sleep(2)
      sign_up_helper
    end
    password = prompt.ask("Enter a password:")
    self.user = User.create(name: name, password: password)
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
      option.choice "Main menu", -> {main_menu}
    end
  end 

  def genres_helper
    system 'clear'
    chosen_genre = prompt.select("Which Genre would you like?", Genre.all_genres)
    songs_by_genre = Song.all.where(genre_id: chosen_genre)
    songs = songs_by_genre.map{|song| {song.name => song.id}}
    chosen_song = prompt.select("Which song would you like?", songs) 

    
      # prompt.select(song_collection) do |options|
      #   option.choice "Enter Song ID", -> ()
      #   option.choice "Choose a different genre", -> (genres_helper)
      #   option.choice "Exit" -> (exit_helper)
  end 

  def artists_helper
    system 'clear'
    artist = Artist.all_artists
      artist_id = prompt.select("Which Artist would you like?", artist)
    artist_selection = user.create_selection_by_artist(artist_id)
    # prompt.select(song_collection) do |options|
    #   option.choice "Enter Song ID", -> ()
    #   option.choice "Choose a different artist", -> (artists_helper)
    #   option.choice "Exit", -> (exit_helper)
  end 

  def songs_helper
    system 'clear'
    song = Song.all_songs
      song_id = prompt.select("Which Song would you like?", song)
      # option.choice "Enter Song ID", -> ()
      # option.choice "Exit", -> (exit_helper)
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
