class GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.order(:name)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = " You've created a Genre"
      redirect_to genres_path
    else
      redirect_to genres_path
      flash[:failure] = " Error"
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end
  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
