class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :song

    def to_s
        self.name 
    end
end