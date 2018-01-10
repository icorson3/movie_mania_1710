require "rails_helper"

describe MovieGenre do 
  context "associations" do 
    it {should belong_to :movie}
    it {should belong_to :genre}
  end
end