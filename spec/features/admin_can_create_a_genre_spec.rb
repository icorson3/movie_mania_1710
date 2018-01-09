require 'rails_helper'

describe "admin visits genre index page" do
  context "as an admin" do
    it "allows admin  create a genre" do
      admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      

      expect(page).to have_content("Admin Categories")
    end
  end
end
