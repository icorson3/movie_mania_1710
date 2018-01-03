class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    movie = Movie.find(params[:movie_id])
    @cart = Cart.new(session[:cart])
    @cart.add_movie(movie.id)
    session[:cart] = @cart.cart_contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(movie.id), movie.title)} in your cart"
    redirect_to movies_path
  end
end
