

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
end
