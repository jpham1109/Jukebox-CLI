class User < ActiveRecord::Base
    has_many :favorites
    has_many :songs, through: :favorites
    


    def all_songs_by_selected_genre(genre_id)
        genre_choice = Genre.all.find{|genre| genre.id == genre_id}
        genre_choice.songs
    end

    def create_selection_by_genre(genre_id)

    end

    def all_songs_by_selected_artist(artist_id)
        artist_choice = Artist.all.find{|artist| artist.id == artist_id}
        artist_choice.songs
    end

    def create_selection_by_artist(artist_id)

    end

    def play_song(song_id)

    end
end


