class SongsController < ApplicationController


  def index
    # show all items
    @songs = Song.all
  end

  def new
    # show new form
    @song = Song.new
  end

  def create
    # create an item
    @song = Song.create(song_params(name: params[:name]))
    redirect_to song_path(@song)
  end

  def show
    # show item with :id
    @song = Song.find(params[:id])
  end

  def edit
    # show edit form for item with :id
    @song = Song.find(params[:id])
  end

  def update
    # update item with :id
    @song = Song.find(params[:id])
    @song.update(song_params(name: params[:name]))
    redirect_to song_path(@song)
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
