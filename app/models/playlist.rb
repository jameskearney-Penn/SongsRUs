class Playlist < ApplicationRecord
    has_many :registrations, dependent: :destroy     
    has_many :users, through: :registrations 

    has_many :tegistrations, dependent: :destroy     
    has_many :songs, through: :tegistrations 

    validates_uniqueness_of :title
end
