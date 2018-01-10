require "rails_helper"

describe MovieGenre do 
  context "validations" do 
    it {should belong_to :movie}
    it {should belong_to :genre}
  end
end