# As an unregistered user, 
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy", 
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating should be an attribute of a movie).

require "rails_helper"

describe "user sees movies with links" do
  context "unregistered user visits movie index page" do 
    it "sees movie links" do

    genre_1 = Genre.create(name: "Adventure")
    genre_2 = Genre.create(name: "Action")
    genre_3 = Genre.create(name: "Sci-Fi")
    director = create(:director)
    movie_1 = Movie.create(title: "Guardians of the Galaxy", description: "great", director_id: director.id, rating: 1, slug: movie_1 )
    movie_genre = MovieGenre.create(movie_id: movie_1.id, genre_id: genre_1.id)
    movie_genre = MovieGenre.create(movie_id: movie_1.id, genre_id: genre_2.id)
    movie_genre = MovieGenre.create(movie_id: movie_1.id, genre_id: genre_3.id)

    visit movies_path
    click_on "Guardians of the Galaxy"

    expect(page).to have_content "#{movie_1.title}"
    expect(page).to have_content "Genres For This Movie: "
    expect(page).to have_content "Adventure"
    expect(page).to have_content "Action"
    expect(page).to have_content "Sci-Fi"
    expect(page).to have_content "#{movie_1.rating}"
   end
  end
end