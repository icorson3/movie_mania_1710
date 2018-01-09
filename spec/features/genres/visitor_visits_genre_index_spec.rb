require 'rails_helper'

describe "When a visitor navigates to the genre index" do
  before :each do
    @genre1 = create(:genre)
    @genre2 = create(:genre)    
  end


  it "the visitor cannot see the new genre form" do
    visit genres_path

    expect(page).to_not have_field("genre[name]")
    expect(page).to_not have_button("Create Genre")
  end

  it "the visitor can see genres with links" do
    expect(page).to have_link("#{@genre1.name}")
    expect(page).to have_link("#{@genre2.name}")
  end
end
