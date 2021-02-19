class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :song

<<<<<<< HEAD
    def to_s
        self.name 
    end

    # def all_songs
    #     self.all.map{|favorite| {favorite.song.name => favorite.id}}
    # end
    
    # def all_song_by_user
    #     self.all.select{|favorite| favorite.user_id == user.id}
    # end


=======
    # def to_s
    #     self.name 
    # end
>>>>>>> 8b808a29e656f212b2fe4309de5ffcb2a06e32d4

    # def self.all_favorites
    #     self.all.map{|song| song.song_id}  
    # end
end