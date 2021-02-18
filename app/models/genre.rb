class Genre < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs

    def to_s
        self.name 
    end

    def self.all_genres
        self.all.map{|genre| {genre.name => genre.id}}  
    end

    
end
