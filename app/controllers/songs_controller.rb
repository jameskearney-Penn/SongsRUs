class SongsController < ApplicationController
  before_action :set_song, only: %i[ destroy ]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
    @spotify_song = RSpotify::Track.find(params[:id])
    @song = already_created
    if @song.nil? 
      @song = Song.create(artist_id: params[:artist_id], title: @spotify_song.name, album: @spotify_song.album.name, spotify_id: @spotify_song.id)
    end
    @artist = Artist.find_by spotify_id: @spotify_song.artists[0].id
    if !@artist.songs.include?(@song)
      @artist.songs << @song
    end
  end

  # GET /songs/new
  def new
    @song = Song.new
  end


  # POST /songs or /songs.json
  def create
    @song = Song.new(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    def already_created
      @song = Song.find_by spotify_id: params[:id]
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:artist_id, :title, :album, :spotify_id)
    end
end
