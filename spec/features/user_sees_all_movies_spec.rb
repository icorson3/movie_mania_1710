require "rails_helper"

describe "user_index" do
  it "user_can_see_all_movies" do
    movie_1 = Movie.create(title: "Drop Dead Fred", description: "An unhappy housewife gets a lift from the return of her imaginary childhood friend")
    movie_2 = Movie.create(title: "Empire Records", description: "Independent Delaware store that employs a tight-knit group of music-savvy youths.")

    visit "/movies"

    expect(page).to have_content("All Movies")
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.description)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.description)
  end
end
