class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :song

    def to_s
        self.name 
    end

    def self.all_songs
        self.all.map{|song| {song.name => song.id}}  
    end


end