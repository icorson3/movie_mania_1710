require "rails_helper"

describe "user sees one movie" do
  it "has one title and description" do
    movie = create(:movie)
    visit movie_path(movie.slug)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end

  it "has a list of genres it belongs to" do
    movie = create(:guardians)
    movie.genres << create(:genre, name: "Action")
    movie.genres << create(:genre, name: "Adventure")
    movie.genres << create(:genre, name: "Sci Fi")

    visit movies_path
    click_on "Guardians of the Galaxy"
    
    within ("#genres") do
      expect(page).to have_content("Genres:")
      expect(page).to have_content("Action")
      expect(page).to have_content("Adventure")
      expect(page).to have_content("Sci Fi")
    end
  end

  it "has a rating" do
    movie = create(:guardians)
    visit movies_path
    click_on "Guardians of the Galaxy"

    expect(page).to have_content("Rating: #{movie.rating}")
  end
end
