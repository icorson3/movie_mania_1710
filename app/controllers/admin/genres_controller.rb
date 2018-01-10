class Admin::GenresController < Admin::BaseController

  def new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "New genre created"
      redirect_to genres_path
    else
      render :new
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end

end
