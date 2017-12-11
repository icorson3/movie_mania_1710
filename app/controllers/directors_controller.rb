class DirectorsController < ApplicationController

  def new
    @director = Director.new
  end

end
