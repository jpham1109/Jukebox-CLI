class Genre < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs

    def self.all_genres
        self.all.map{|genre| genre.name}.uniq
    end

    def all_songs_by_genre(genre_name)
        genre_choice = self.all.find{|genre| genre.name == genre_name}
        puts genre_choice.songs
    end
end
