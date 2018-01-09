class Admin::GenresController < Admin::BaseController

    def index
      @genre = Genre.new
      @genres = Genre.all
    end

end