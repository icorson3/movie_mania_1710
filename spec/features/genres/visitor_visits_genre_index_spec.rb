require 'rails_helper'

describe "When a visitor navigates to the genre index" do
  before :each do
    @genre1 = Genre.create(name: "Action")
    @genre2 = Genre.create(name: "Adventure")
    @movie1 = create(:movie, title: "Guardians of the Galaxy", rating: 5)
    @movie2 = create(:movie, title: "Suicide Squad", rating: 3)
    MovieGenre.create(movie: @movie1, genre: @genre1)
    MovieGenre.create(movie: @movie2, genre: @genre1)

  end
  
  it "the visitor cannot see the new genre form" do
    visit genres_path

    expect(page).to_not have_field("genre[name]")
    expect(page).to_not have_button("Create Genre")
  end

  it "the visitor can see genres with links" do
    visit genres_path

    expect(page).to have_link("#{@genre1.name}")
    expect(page).to have_link("#{@genre2.name}")
  end

  it "the visitor can navigate to genre show page" do
    visit genres_path

    click_link "#{@genre1.name}"

    expect(current_path).to eq(genre_path(@genre1))
    expect(page).to have_content("#{@genre1.name}")
    expect(page).to have_content("Guardians of the Galaxy")
    expect(page).to have_content("Suicide Squad")
    expect(page).to have_content("Average Rating: 4")
  end
end
