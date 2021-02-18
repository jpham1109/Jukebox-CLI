class User < ActiveRecord::Base
    has_many :favorites
    has_many :songs, through: :favorites

   
    def all_songs_by_selected_artist(artist_id)
        artist_choice = Artist.all.find{|artist| artist.id == artist_id}
        artist_choice.songs
    end

    def create_selection_by_artist(artist_id)

    end

    def play_song
    
    end

    # def view_favorites
    #  Favorites.all#.select{|favorite| favorite.user_id == user.id}
    # end


end


