class RegistrationsController < ApplicationController
  
    before_action :set_playlist 
    before_action :set_user 
    before_action :authenticate_user
  
    def add_playlist
      @playlist.users << @user unless @playlist.users.include?(@course)
      redirect_to @playlist
    end
  
    def delete_playlist
      @playlist.users.delete(@user) unless !@playlist.users.include?(@user)
      redirect_to @playlist
    end
  
    def set_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end

    
  end
