require 'rails_helper'

describe "When an Admin User navigates to genres index" do
  before :each do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

  end

  it "the Admin can see the index" do
    visit admin_genres_path

    # expect(page).to have_field("genre[]")
    save_and_open_page
    expect(page).to have_button("Create Genre")


    fill_in "genre[name]", with: "Sci-Fi"
    click_button "Create Genre"

    expect(current_path).to eq(admin_genres_path)
    expect(page).to have_content("Sci-Fi")
  end

end
