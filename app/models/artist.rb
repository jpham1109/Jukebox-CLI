class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def to_s
        self.name 
    end

    def self.all_artists
        self.all.map{|artist| {artist.name => artist.id}}  
    end
end
