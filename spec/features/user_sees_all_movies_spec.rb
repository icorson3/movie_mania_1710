require "rails_helper"

describe "user_index" do
  it "user_can_see_all_movies" do
    director_1 = Director.create!(name: "Ali")
    director_2 = Director.create!(name: "Kelley")
    movie_1 = Movie.create!(title: "Drop Dead Fred", description: "An unhappy housewife gets a lift from the return of her imaginary childhood friend", director_id: director_1.id)
    movie_2 = Movie.create!(title: "Empire Records", description: "Independent Delaware store that employs a tight-knit group of music-savvy youths.", director_id: director_2.id)

    visit "/movies"

    expect(page).to have_content("All Movies")
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.description)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.description)
  end
end
