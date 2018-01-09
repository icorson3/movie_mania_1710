require 'rails_helper'

describe "unregistered user visits genre index page" do
  before(:each) do
    @genre1= Genre.create(name:"comedy")
    @genre2 =  Genre.create(name:"thriller")
    user = User.create(username: "funbucket13", password: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit genres_path
  end

  context "as an unregistered user" do
    it "does not all me to create a genre" do
      expect(page).not_to have_content("Create Genre")
    end

    it " allows me to see all genres" do
      expect(page).to have_content("comedy")
      expect(page).to have_content("thriller")
    end

    it "allows me to click on a genre and go to its show page" do
      click_on("thriller")
      expect(current_path).to eq(genre_path(@genre2))
      expect(page).to have_content("thriller")
    end
  end
end
