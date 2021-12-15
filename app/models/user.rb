class User < ApplicationRecord
    has_many :registrations, dependent: :destroy     
    has_many :playlists, through: :registrations
    include BCrypt

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end
end
