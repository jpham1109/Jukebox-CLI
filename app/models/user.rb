class User < ActiveRecord::Base
    has_many :favorites
    has_many :songs, through: :favorites
    
end
