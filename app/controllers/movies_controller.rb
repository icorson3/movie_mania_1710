class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    byebug
    @movie = Movie.find_by(slug: params[:id])
  end

  def new
    @director = Director.find(params[:director_id])
    @movie = Movie.new
  end

  def create
    director = Director.find(params[:director_id])
    movie = director.movies.new(movie_params)

    if movie.save
      redirect_to "/movies/#{movie.slug}"
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
