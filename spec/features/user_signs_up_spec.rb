require "rails_helper"

describe "user signs up for account" do
  context "they visit the root page" do
    context "they click on registration link" do
      context "they fill in registration form" do
        it "a new user account is created" do
          visit "/"

          click_on "Sign Up"

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: "funbucket13"
          fill_in "user[password]", with: "test"

          click_on "Create User"

          expect(page).to have_content("Welcome, funbucket13")
        end
      end
    end
  end
end
