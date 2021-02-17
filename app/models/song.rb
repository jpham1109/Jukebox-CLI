class Song < ActiveRecord::Base
    belongs_to :album
    belongs_to :genre
    has_many :favorites
    has_many :users, through: :favorites

end