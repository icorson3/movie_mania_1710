class Admin::GenresController < Admin::BaseController

  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @image.save
      flash[:success] = " You've created a Genre"
      redirect_to admin_genres_path
    else
      redirect_to admin_genres_path
      flash[:failure] = " Error"
    end
  end



  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
