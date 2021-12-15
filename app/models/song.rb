class Song < ApplicationRecord
  belongs_to :artist
  has_many :tegistrations, dependent: :destroy     
  has_many :playlists, through: :tegistrations 

  validates_uniqueness_of :spotify_id
end
