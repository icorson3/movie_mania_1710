require "rails_helper"

describe "As an unregistered user visiting the movie index" do
  before(:each) do
    director = create(:director)
    @movie_1 = create(:movie, title: "Guardians of the Galaxy", director: director)
    @movie_2 = create(:movie, title: "Luck Key", director: director)
    @genre1 = create(:genre, name: "Action")
    @genre2 = create(:genre, name: "Sci-Fi")
    @genre3 = create(:genre, name: "Adventure")
    @movie_1.genres << [@genre1, @genre2, @genre3]
    visit movies_path
  end

  it "user_can_see_all_movies" do
    expect(page).to have_content("All Movies")
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.description)
    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_2.description)
  end

  describe "I can click on link for an individual movie" do
    describe "it will take me to a movie show page" do
      it "will have the genres for that movie and that movie's rating" do
        click_on "Guardians of the Galaxy"

        expect(current_path).to eq movie_path(@movie_1)
        expect(page).to have_content "Genres for this Movie:"
        expect(page).to have_content @genre1.name
        expect(page).to have_content @genre2.name
        expect(page).to have_content @genre3.name
        expect(page).to have_content @movie_1.rating 
      end
    end
  end


end
