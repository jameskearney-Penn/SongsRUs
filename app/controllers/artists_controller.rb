class ArtistsController < ApplicationController
  
  def search
  end

  def index
    if !params[:artist_name].empty?
      @artists = RSpotify::Artist.search(params[:artist_name])
    else
      redirect_to root_path
    end
  end
  
  def show
    @artist = RSpotify::Artist.find(params[:id])
    Artist.create(name: @artist.name, spotify_id: @artist.id)
  end

  # GET /songs/new
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:song).permit(:spotify_id, :name)
    end
end
