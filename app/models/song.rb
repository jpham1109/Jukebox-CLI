class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :favorites
    has_many :users, through: :favorites

    def to_s
        self.name 
    end

    def selected_genre
        self.all.where(genre_id: chosen_genre)
    end

    def self.all_songs_by_genre
        selected_genre.map{|song| {song.name => song.id}}
    end
end