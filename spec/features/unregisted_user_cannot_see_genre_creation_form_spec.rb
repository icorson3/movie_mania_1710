require 'rails_helper'

describe "unregistered yser visits genre index page" do
  context "as an unregistered user" do
    it "does not all me to   create a genre" do
      user = User.create(username: "funbucket13",
                          password: "test")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).not_to have_content("Create Genre")


    end
    # it "allows admin  see a genre it has created" do
    #   admin = User.create(username: "funbucket13",
    #                       password: "test",
    #                       role: 1)
    #
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    #
    #   visit admin_genres_path
    #
    #   fill_in 'genre[name]', with: "comedy"
    #
    #   click_button "Create Genre"
    #   expect(page).to have_content("Genre: comedy")
    # end
  end
end
