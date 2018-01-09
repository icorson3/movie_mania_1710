class Admin::GenresController < Admin::BaseController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "Genre #{@genre.name} sucessfully created!"
      redirect_to admin_genres_path
    else
      @genres = Genres.all
      render :index
    end
  end

  private

    def genre_params
      params.permit(:genre).require(:name)
    end


end
