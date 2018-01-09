require "rails_helper"

describe Movie, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
  end

  describe "relationships" do
    it {should have_many(:genres)}
    it {should belong_to(:director)}
    it {should have_many(:genre_movies)}
  end

end
