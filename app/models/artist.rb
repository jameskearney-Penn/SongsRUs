class Artist < ApplicationRecord
    has_many :songs, dependent: :destroy  
    validates_uniqueness_of :spotify_id
end
