require 'rails_helper'


feature "admin vitis genre index page" do 
  before  do 
     admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_genres_path
  end
  scenario "sees a form to create a new genre " do 
    expect(page).to have_content("Create a genre")
    fill_in "genre[name]", with: "Comedy"
    click_on "Create Genre"

    expect(page).to have_content("Comedy")
  end
end







# As an admin user, 
# When I visit the genre index,
# I can see a form to create new genres,
# When I fill out the form with the genre's name, 
# And click submit, 
# I see a list of genres I have created. 