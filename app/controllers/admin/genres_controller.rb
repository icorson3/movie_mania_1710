class Admin::GenresController < Admin::BaseController

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash.notice = "#{@genre.name} successfully created."
      redirect_to genres_path
    else
      flash.notice = "Please try to create a genre again with the correct information."
      redirect_to genres_path
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end

end
