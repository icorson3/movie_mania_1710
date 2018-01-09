describe "unregistered user visits genre index page" do
  context "they click on a genre" do
    it "sees genre page with genres for that movie and rating" do
      movie = create(:movie, rating: 5)
      movie2 = create(:movie, rating: 3)
      genre = create(:genre)
      MovieGenre.create(movie: movie, genre: genre)
      MovieGenre.create(movie: movie2, genre: genre)

      visit genres_path

      click_on "#{genre.name}"

      expect(current_path).to eq genre_path(genre)
      expect(page).to have_content genre.name

      expect(page).to have_content movie.title
      expect(page).to have_content movie2.title

      expect(page).to have_content "Average Rating:"
      expect(page).to have_content genre.average_rating
    end
  end
end
