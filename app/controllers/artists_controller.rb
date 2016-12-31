class ArtistsController < ApplicationController

  def index
    # show all items
    @artists = Artist.all
  end

  def new
    # show new form
    @artist = Artist.new
  end

  def create
    # create an item
    @artist = Artist.create(artist_params(name: params[:name], bio: params[:bio]))
    redirect_to artist_path(@artist)
  end

  def show
    # show item with :id
    @artist = Artist.find(params[:id])
  end

  def edit
    # show edit form for item with :id
    @artist = Artist.find(params[:id])
  end

  def update
    # update item with :id
    @artist = Artist.find(params[:id])
    @artist.update(artist_params(name: params[:name], bio: params[:bio]))
    redirect_to artist_path(@artist)
  end

  private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

end
