require 'rails_helper'

describe "As an unregistered user when I visit the genre index" do
  before(:each) do
    @user = create(:user)
    @movie_1 = create(:movie, title: "Guardians of the Galaxy", rating: 80)
    @movie_2 = create(:movie, title: "Suicide Squad", rating: 70)
    @genre1 = create(:genre, name: "Action")
    @genre2 = create(:genre, name: "Sci-Fi")
    @genre3 = create(:genre, name: "Adventure")
    @movie_1.genres << [@genre1, @genre2, @genre3]
    @movie_2.genres << @genre1

    visit genres_path
    click_on "Action"
  end

  describe "I click on a link to genre" do
    it "takes me to a genre show page with genre's name" do
      expect(current_path).to eq genre_path(@genre1)
      expect(page).to have_content @genre1.name
    end

    it "displays movies in this genre" do
      expect(page).to have_content @movie_1.title
      expect(page).to have_content @movie_2.title
    end

    it "shows the average rating for movies in this genre" do
      expect(page).to have_content "Average Rating of Movies: #{@genre1.average_movie_rating}"
    end
  end
end
