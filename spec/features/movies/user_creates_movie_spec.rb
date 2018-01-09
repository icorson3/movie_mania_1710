require "rails_helper"

describe "user creates a new movie for a director" do
  xit "creats a new movie associated with a movie" do
    director = create(:director)

    visit "/directors/#{director.id}/movies/new"

    fill_in "movie[title]", with: "Finding Nemo"
    fill_in "movie[description]", with: "A sad fish story that ends happy."

    click_on "Create Movie"

    expect(page).to have_content("A sad fish story that ends happy.")
  end
end
