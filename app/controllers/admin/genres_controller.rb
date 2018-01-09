class Admin::GenresController < Admin::BaseController

    def index
      @genre = Genre.new
      @genres = Genre.all
    end

    def create
      genre = Genre.new(genre_params)
      if genre.save
        redirect_to admin_genres_path
      else
        flash[:error] = "genre did not save please try again"
        render :index
      end
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end

end