class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      flash.notice = "Genre wasn't save, make sure it isn't a duplicate"
      redirect_to genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
