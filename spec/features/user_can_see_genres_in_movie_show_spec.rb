# As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating should be an attribute of a movie).
require 'rails_helper'

describe "unregistered user visits movie index page" do
  context "they click on a movie" do
      before(:each) do
        @movie = create(:movie)
        visit movie_path(@movie)
      end
    it "sees movie page with genres for that movie" do

      

    end
