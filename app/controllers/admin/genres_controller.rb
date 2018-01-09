class Admin::GenresController < Admin::BaseController
    # before_action :require_admin

    def index
      @genre = Genre.new
      @genres = Genre.all
    end

    def create
      @genre = Genre.new(genre_params)
        if @genre.save
          redirect_to admin_genres_path
        else
          render :index
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end


    # def require_admin
    #   render file: "/public/404" unless current_admin?
    # end
end
