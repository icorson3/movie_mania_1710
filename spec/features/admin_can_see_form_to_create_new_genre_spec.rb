require 'rails_helper'

describe "admin visits genre index page" do
  context "as an admin" do
    context "admin can see a form to create a new genre" do
      before(:each) do
        admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_genres_path
      end

      it "allows admin to fill out new genre form" do

        fill_in "genre[name]", with: "Action"
        click_on "Create Genre"

        expect(current_path).to eq("/admin/genres")
        expect(page).to have_content("Action")


        fill_in "genre[name]", with: "Adventure"
        click_on "Create Genre"

        expect(page).to have_content("Action")
        expect(page).to have_content("Adventure")

      end
    end
  end
end
