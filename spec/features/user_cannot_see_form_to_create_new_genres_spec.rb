# As an unregistered user,
# When I visit the genre index,
# I cannot see the form to create new genres,
# I see all genres (for testing purposes, I should see at least 2)
# and each genre should be a link to that genre's specific page

require 'rails_helper'

describe "unregistered user visits genre index page" do
  it "does not show create new genres form" do

    visit genres_path

    expect(page).to_not have_content("Create New Genre")
    expect(page).to_not have_button("Create Genre")
  end

  it "does have a list of genres with links to genre show page" do

    genre1 = create(:genre)
    genre2 = create(:genre)

    visit genres_index

    expect(page).to have_content(genre1.name)
    expect(page).to have_button(genre2.name)
    expect(page).to have_link(genre1.name)
    expect(page).to have_link(genre2.name)
  end
end
