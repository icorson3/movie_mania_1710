genrequire "rails_helper"

describe "user sees one movie" do
  it "has one title and description" do
    movie = create(:movie)
    visit movie_path(movie.slug)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end
end
