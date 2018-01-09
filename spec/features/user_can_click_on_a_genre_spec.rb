require "rails_helper"

describe "genre_index" do
  before(:each) do
    director = create(:director)

    @gog = director.movies.create(title:"Guardians of the Galaxy", rating: 5)
    @ss = director.movies.create(title:"Suicide Squad", rating: 15)
    @pt = director.movies.create(title:"Parent Trap", rating: 4)
    @it = director.movies.create(title:"Interstellar", rating: 8)

    @action = Genre.create(name:"action")
    @comedy = Genre.create(name:"comedy")
    @scifi = Genre.create(name:"scifi")

    GenreMovie.create!(genre: @action, movie:@gog)
    GenreMovie.create!(genre: @action, movie:@ss)
    GenreMovie.create!(genre: @scifi, movie:@gog)
    GenreMovie.create!(genre: @scifi, movie:@ss)
    GenreMovie.create!(genre: @comedy, movie:@pt)
    GenreMovie.create!(genre: @comedy, movie:@it)

    visit "/genres"
  end

  it "user_can click on a genre from the genres index" do
    click_link ("action")

    expect(current_path).to eq(genre_path(@action))
  end

  it "can see the genres name" do
    click_link ("action")

    expect(page).to have_content("action")
  end

  it "user can see the movies belonging to that genre" do
    click_link ("action")

    expect(page).to have_content("Guardians of the Galaxy")
    expect(page).to have_content("Suicide Squad")
  end

  it "user can see the average rating of movies in that genre" do
    click_link ("action")

    expect(page).to have_content(10)
  end

  it "user_can click on a genre from the genres index" do
    click_link ("comedy")

    expect(current_path).to eq(genre_path(@comedy))
  end

    it "can see the genres name" do
      click_link ("comedy")

      expect(page).to have_content("comedy")
    end

    it "user can see the movies  belonging to that genre" do
      click_link ("comedy")

      expect(page).to have_content("Interstellar")
      expect(page).to have_content("Parent Trap")
    end

    it "user can see the average rating of movies in that genre" do
      click_link ("comedy")

      expect(page).to have_content(6)
    end
end
