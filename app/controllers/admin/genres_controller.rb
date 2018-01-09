class Admin::GenresController < Admin::BaseController

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

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
