require 'rails_helper'

describe "an admin visits the genre index page" do
  context "the admin can see a form to create a new genre" do
    context "the admin can fill out the form to create a new genre" do
      it "the admin clicks submit and sees a list of genres created" do

        admin = create(:user, role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit genres_path

        expect(page).to have_field(:name)

        fill_in "genre[name]", with: "Action"
        click_button "Submit"

        expect(current_path).to eq(genres_path)

        expect(page).to have_content("Action")


      end
    end
  end
end
