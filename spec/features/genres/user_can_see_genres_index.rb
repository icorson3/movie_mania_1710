require 'rails_helper'

describe "When an Admin User navigates to genres index" do
  before :each do
    admin = create(:user, role: 1)



  end

  it "the Admin can see the index" do

  end



end

As an admin user,
When I visit the genre index,
I can see a form to create new genres,
When I fill out the form with the genre's name,
And click submit,
I see a list of genres I have created.
