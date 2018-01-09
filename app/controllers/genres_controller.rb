class Genres_Controller < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end
end
