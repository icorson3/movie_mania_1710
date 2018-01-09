require "rails_helper"

describe "user_index" do
  before(:each) do
    director = create(:director)
    @gog = director.movies.create(title:"Guardians of the Galaxy", rating: 5)
    action = Genre.create(name:"action")
    adventure = Genre.create(name:"adventure")
    scifi = Genre.create(name:"scifi")

    GenreMovie.create!(genre: action, movie:@gog)
    GenreMovie.create!(genre: adventure, movie:@gog)
    GenreMovie.create!(genre: scifi, movie:@gog)

  end
  it "user_can click on a movie from the index" do

    visit "/movies"
    click_link ("Guardians of the Galaxy")

    expect(current_path).to eq(movie_path(@gog.slug))

  end
  it "user_can see the genres belonging to that movie" do

    visit "/movies"
    click_link ("Guardians of the Galaxy")
    expect(page).to have_content("action")
    expect(page).to have_content("scifi")
    expect(page).to have_content("adventure")
  end
end
