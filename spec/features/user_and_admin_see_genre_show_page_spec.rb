require 'rails_helper'

describe "user visits genre show page" do
  context "as an admin" do
    it "shows specific genre" do
      admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)
      genre = Genre.create(name: "Sci-Fi")
      genre1 = Genre.create(name: "Adventure")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genre_path(genre)

      expect(page).to have_content("Sci-Fi")
    end
  end

  context "as a default user" do
    it "does not allow default user to see admin genre form" do
      user = create(:user)
      genre = Genre.create(name: "Sci-Fi")
      genre1 = Genre.create(name: "Adventure")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genre_path(genre)

      expect(page).to have_content("Sci-Fi")
    end
  end
end
