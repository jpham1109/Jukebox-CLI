class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :song

    # def to_s
    #     self.name 
    # end

    # def self.all_favorites
    #     self.all.map{|song| song.song_id}  
    # end
end