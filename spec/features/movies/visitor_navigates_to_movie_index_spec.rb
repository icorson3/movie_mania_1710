require 'rails_helper'

describe "When an visitor visits movies index" do
  before :each do
    genre1 = Genre.create(name: "Sci-Fi")
    genre2 = Genre.create(name: "Adventure")
    genre3 = Genre.create(name: "Action")
    @movie = create(:movie, name: "Guardians of the Galaxy")
    mg1 = MovieGenre.create(movie: @movie, genre: genre1)
    mg2 = MovieGenre.create(movie: @movie, genre: genre2)
    mg3 = MovieGenre.create(movie: @movie, genre: genre3)
  end


  it "the visitor can navigate to a movie show page" do
    visit movies_path

    click_link "Guardians of the Galaxy"

    expect(current_path).to eq(movie_path(@movie))
    expect(page).to have_content("Genres for this Movie:")
    expect(page).to have_content("Action")
    expect(page).to have_content("Sci-Fi")
    expect(page).to have_content("Adventure")
    



  end


end


As an unregistered user,
When I visit the movie index,
And I click on "Guardians of the Galaxy"
I see a page with "Guardians of the Galaxy",
I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
I also see the rating for this movie (rating should be an attribute of a movie).
