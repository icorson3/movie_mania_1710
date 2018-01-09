# As an unregistered user, 
# When I visit the genre index,
# And I click on "Action", 
# I see a page with the genre's name, 
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see the average rating for movies in this category

require "rails_helper"

describe "user sees genres with links" do
  context "unregistered user visits genre page" do 
    context "they click on a genre" do 
    it "sees genre links" do
      
    genre_2 = Genre.create(name: "Action")
    director = create(:director)
    movie_1 = Movie.create(title: "Guardians of the Galaxy", description: "great", director_id: director.id, rating: 1, slug: movie_1 )
    movie_2 = Movie.create(title: "Suicide Squad", description: "great", director_id: director.id, rating: 5, slug: movie_2 )
    movie_genre = MovieGenre.create(movie_id: movie_1.id, genre_id: genre_2.id)
    movie_genre = MovieGenre.create(movie_id: movie_2.id, genre_id: genre_2.id)

    
    visit genres_path

    click_on "Action"

    expect(page).to have_content(genre_2.name)
    expect(page).to have_content("Guardians of the Galaxy")
    expect(page).to have_content("Suicide Squad")
    expect(page).to have_content("Average Rating: #{genre_2.average_movie_rating}")
    end
   end
  end
end