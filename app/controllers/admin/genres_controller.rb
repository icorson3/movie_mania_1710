class Admin::GenresController < Admin::BaseController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "You've created a new Genre!"

      redirect_to admin_genres_path
    else
      render :index
    end
  end



  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
