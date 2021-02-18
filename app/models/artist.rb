class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def to_s
        # self.songs.name 
    end

    # def self.all_favorites
    #     self.all.map{|artist| {artist.name => artist.id}}  
    # end
end
