require 'rails_helper'


feature "user vitis genre index page" do 
  before  do 
   
  end
  scenario "as an admin they see a form to create  a genre, after completing it they see the genre " do 

     admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_genres_path

    expect(page).to have_content("Create a genre")
    fill_in "genre[name]", with: "Comedy"
    click_on "Create Genre"

    expect(page).to have_content("Comedy")
  end

  scenario "as an unregistered user they do not see the form to create a new genre " do 
    visit genres_path
    genre1 = Genre.create(name: "Comedy")
    genre2 = Genre.create(name: "Thriller")

    expect(page).to_not have_content("Create a genre")

  end


end


# As an unregistered user,
# When I visit the genre index,
# I cannot see the form to create new genres, 
# I see all genres (for testing purposes, I should see at least 2) 
# and each genre should be a link to that genre's specific page






# As an admin user, 
# When I visit the genre index,
# I can see a form to create new genres,
# When I fill out the form with the genre's name, 
# And click submit, 
# I see a list of genres I have created. 