require 'rails_helper'

describe "As an unregistered user" do
  describe "When I visit the genre index" do
    before(:each) do
      @user = create(:user)
      @movie_1 = create(:movie, title: "Guardians of the Galaxy")
      @movie_2 = create(:movie, title: "Suicide Squad")
      @genre1 = create(:genre, name: "Action")
      @genre2 = create(:genre, name: "Sci-Fi")
      @genre3 = create(:genre, name: "Adventure")
      @movie_1.genres << [@genre1, @genre2, @genre3]
      @movie_2.genres << @genre1

      visit genres_path
    end

    it "cannot see the form to create new genres" do
      expect(page).to_not have_content "Submit"
      expect(page).to_not have_content "Name:"

      #can you test for non-existence of a form field??
      # expect(find_field("genre[name]")).to eq false
    end

    it "sees all genres with links to each genre's show page" do
      expect(page).to have_content @genre1.name
      expect(page).to have_content @genre2.name
      expect(find_link("#{@genre1.name}").visible?).to eq true
      expect(find_link("#{@genre2.name}").visible?).to eq true
    end
  end
end
