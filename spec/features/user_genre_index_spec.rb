require 'rails_helper'

describe "As an unregistered user" do
  describe "When I visit the genre index" do
    before(:each) do
      @user = create(:user)
      @genre1, @genre2 = create_list(:genre, 2)
      visit genres_path
    end

    it "cannot see the form to create new genres" do
      expect(page).to_not have_content "Submit"
      expect(page).to_not have_content "Name:"
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
