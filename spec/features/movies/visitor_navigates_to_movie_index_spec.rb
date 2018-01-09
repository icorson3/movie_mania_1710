require 'rails_helper'

describe "When an visitor visits movies index" do
  before :each do
    genre1 = Genre.create(name: "Sci-Fi")
    genre2 = Genre.create(name: "Adventure")
    genre3 = Genre.create(name: "Action")
    @movie = create(:movie, title: "Guardians of the Galaxy", rating: 5)
    mg1 = MovieGenre.create(movie: @movie, genre: genre1)
    mg2 = MovieGenre.create(movie: @movie, genre: genre2)
    mg3 = MovieGenre.create(movie: @movie, genre: genre3)
  end

  it "the visitor can navigate to a movie show page" do
    visit movies_path

    click_link "Guardians of the Galaxy"

    expect(current_path).to eq(movie_path(@movie.slug))
    expect(page).to have_content("Genres for this Movie:")
    expect(page).to have_content("Action")
    expect(page).to have_content("Sci-Fi")
    expect(page).to have_content("Adventure")
    expect(page).to have_content("Rating: 5")
  end
end
