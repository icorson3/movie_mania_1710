require 'rails_helper'

describe "user visits genre index page" do
  context "as an admin" do
    it "allows admin to see a form to make new genres" do
      admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      expect(page).to have_content("Genre List:")
      expect(page).to have_content("Admin Genre Form")
    end
  end

  context "as a default user" do
    it "does not allow default user to see admin genre form" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_genres_path

      expect(page).to_not have_content("Admin Genre Form")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
