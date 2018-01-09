require 'rails_helper'

feature "user visits the genre show page" do 
  scenario "it sees the movies assocaited with that genre" do 
    director = Director.create(name: "Steve")
    movie1 = director.movies.create(title: "Guardians of the  Galaxy", description: "people get lost", rating: 10)
    movie2 = director.movies.create(title: "Suicide Squad", description: "peopele fighting", rating: 2)
    genre1 = Genre.create(name: "Action")
    MovieGenre.create(movie_id: movie1.id, genre_id: genre1.id)
    MovieGenre.create(movie_id: movie2.id, genre_id: genre1.id)

    visit genre_path(genre1)
  
    expect(page).to have_content("Guardians of the Galaxy")
    expect(page).to have_content("Suicide Squad")
    expect(page).to have_content(6)
  end
end 




# As an unregistered user, 
# When I visit the genre index,
# And I click on "Action", 
# I see a page with the genre's name, 
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see the average rating for movies in this category