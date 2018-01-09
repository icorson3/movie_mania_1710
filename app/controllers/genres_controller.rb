class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new()
    binding.pry
  end

end
