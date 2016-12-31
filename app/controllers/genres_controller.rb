class GenresController < ApplicationController

  def index
    # show all items
    @genres = Genre.all
  end

  def new
    # show new form
    @genre = Genre.new
  end

  def create
    # create an item
    @genre = Genre.create(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  def show
    # show item with :id
    @genre = Genre.find(params[:id])
  end

  def edit
    # show edit form for item with :id
    @genre = Genre.find(params[:id])
  end

  def update
    # update item with :id
    @genre = Genre.find(params[:id])
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
