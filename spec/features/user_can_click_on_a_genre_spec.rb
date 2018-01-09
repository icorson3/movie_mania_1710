require "rails_helper"

describe "genre_index" do
  before(:each) do
    director = create(:director)
    @gog = director.movies.create(title:"Guardians of the Galaxy", rating: 5)
    @ss = director.movies.create(title:"Suicide Squad", rating: 15)

    @action = Genre.create(name:"action")
    @adventure = Genre.create(name:"adventure")
    @scifi = Genre.create(name:"scifi")

    GenreMovie.create!(genre: @action, movie:@gog)
    GenreMovie.create!(genre: @action, movie:@ss)
    GenreMovie.create!(genre: @scifi, movie:@gog)
    GenreMovie.create!(genre: @scifi, movie:@ss)

    visit "/genres"
    click_link ("action")
  end

  it "user_can click on a genre from the genres index" do
    expect(current_path).to eq(genre_path(@action))
  end

  it "can see the genres name" do
    expect(page).to have_content("action")
  end

  it "user can see the movies  belonging to that genre" do
    expect(page).to have_content("Guardians of the Galaxy")
    expect(page).to have_content("Suicide Squad")
  end

  it "user can see the movies  belonging to that genre" do
    expect(page).to have_content(10)
  end
end
