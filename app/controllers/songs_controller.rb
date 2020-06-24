class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.invalid?
      render :edit
    else
      @song.save
      redirect_to song_path(@song)
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end
end
