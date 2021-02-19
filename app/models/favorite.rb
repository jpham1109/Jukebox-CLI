class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :song

    def to_s
        self.name 
    end

    # def all_songs
    #     self.all.map{|favorite| {favorite.song.name => favorite.id}}
    # end
    
    # def all_song_by_user
    #     self.all.select{|favorite| favorite.user_id == user.id}
    # end



end