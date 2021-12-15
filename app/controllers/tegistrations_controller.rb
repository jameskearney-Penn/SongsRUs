class TegistrationsController < ApplicationController
    before_action :set_playlist 
    before_action :set_song

    def add_song
      @playlist.songs << @song unless @playlist.songs.include?(@song)
      redirect_to @playlist
    end
    
    def delete_song
      @playlist.songs.delete(@song) unless !@playlist.songs.include?(@song)
      redirect_to @playlist
    end

    def set_song
      @song = Song.find(params[:song_id])
    end

    def set_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end
end
