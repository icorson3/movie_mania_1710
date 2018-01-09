require "rails_helper"

describe "when and admin visits a genre index" do
  it "shows a form to create a new genre" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit genres_path

    expect(page).to have_content("All Genres")

    fill_in "genre[name]", with: "horror"
    click_on "Create Genre"

    expect(page).to have_content(Genre.last.name)
  end

  describe "an unregistered user cannot create a new genre" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit genres_path

    
  end
end
