require "rails_helper"

describe "user_index" do
  it "user_can_see_all_movies" do

    director = create(:director)
    movie_1, movie_2 = create_list(:movie, 2, {director_id: director.id})

    visit "/movies"

    expect(page).to have_content("All Movies")
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.description)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.description)
  end

  it "should show all genres belonging to that movie" do
    user = user(:create)
    movie_1 = create(:movie, director_id: director.id)
    genre = Genre.create(name: "Action")
    genre2 = Genre.create(name: "Adventure")
    genre3 = Genre.create(name: "Sci-Fi")
    mg = MovieGenre.create(movie: movie_1, genre: genre)
    mg = MovieGenre.create(movie: movie_1, genre: genre2)
    mg = MovieGenre.create(movie: movie_1, genre: genre3)
    visit movies_path
    click_on "#{movie_1.name}"

    expect(current_path).to eq(movie_path(movie_1))
    expect(page).to have_content("Action")
    expect(page).to have_content("Adventure")
    expect(page).to have_content("Sci-Fi")
    expect(page).to have_content("Rating: 4")
  end
end
