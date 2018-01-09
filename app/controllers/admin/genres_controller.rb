class Admin::GenresController < Admin::BaseController
    # before_action :require_admin

    def index
      @genres = Genre.all
      @genre = Genre.new
    end

    def new
      @genre = Genre.new
    end

    def create
      @genre = Genre.create!(genre_params)
      if @genre.save
        redirect_to admin_genres_path
      else
        render :new
      end
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end

    # def require_admin
    #   render file: "/public/404" unless current_admin?
    # end
end
