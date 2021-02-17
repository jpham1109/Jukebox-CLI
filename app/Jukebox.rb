class Jukebox
  attr_reader :prompt
  attr_accessor :user, :password
  
  def initialize
    #config this out later
    @prompt = TTY::Prompt.new
  end
  
  def run
      welcome
    # login_or_signup
    # wanna_see_favs?
    # some_method(some_argument)
    # exit
  end
  
  def welcome
    #welcome_music
    sleep(2)
    puts "Welcome to...".colorize(:magenta)
    sleep(2)
    banner #set this up
    sleep(2)
    prompt.select("Sign in or Sign up") do |option|
      option.choice "Sign in", -> {sign_in_helper}
      option.choice "Sign up", -> {sign_up_helper}
      option.choice "Exit", -> {exit_helper}
    end
  end 

  def sign_in_helper
    name = prompt.ask("What is your username?")
    if self.user = User.find_by(name: name)
      puts "Welcome back #{user.name}!"
    else
      puts "username not found"
      sign_up_helper
    end
  end 

  def main_menu
    system 'clear'
    puts "Welcome #{user.name}"
    #banner?
    prompt.select("Browse or View list") do |option|
      option.choice "Browse categories", -> {categories_helper}
      option.choice "View favorites", -> {favorites_helper}
      option.choice "Exit", -> {exit_helper}
    end
  end

  def categories_helper
    system 'clear'
    prompt.select("Browse") do |option|
      option.choice "Genres", -> {genres_helper}
      option.choice "Artists", -> {artists_helper}
      option.choice "Songs", -> {song_helper}
      option.choice "Main menu", -> {main_menu}
    end
  end 

  def genres_helper
    genre = Genre.all_genres
      genre_id = prompt.select("Which Genre would you like?", genre)
    genre_selection = 
  end 
  # private

  
end
