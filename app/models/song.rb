class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :favorites
    has_many :users, through: :favorites

    def to_s
        self.name 
    end

    def self.all_songs
        self.all.map{|song| {song.name => song.id}}  
    end

end