require "rails_helper"

describe "user sees one movie" do
  it "has one title and description" do
    movie = create(:movie)
    visit movie_path(movie.slug)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end
  it "as unregistered user, sees the genres associated with that movie " do 
    director = Director.create(name: "Steve")
    movie1 = director.movies.create(title: "Guardians of the  Galaxy", description: "people get lost", rating: 4)
    genre1 = Genre.create(name: "Action")
    genre2 = Genre.create(name: "Adventure")
    genre3 = Genre.create(name: "Sci-Fi")
    MovieGenre.create(movie_id: movie1.id, genre_id: genre1.id)
    MovieGenre.create(movie_id: movie1.id, genre_id: genre2.id)
    MovieGenre.create(movie_id: movie1.id, genre_id: genre3.id)

    visit movie_path(movie1)
    
    
    expect(page).to have_content("Action")
    expect(page).to have_content("Adventure")
     expect(page).to have_content("Sci-Fi")
    expect(page).to have_content("Guardians of the Galaxy")
    expect(page).to have_content("Sci-Fi")
    expect(page).to have_content(4)

  end
end



# As an unregistered user, 
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy", 
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating should be an attribute of a movie).