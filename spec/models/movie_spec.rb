require "rails_helper"

describe Movie, type: :model do
  describe "relationships" do
    it {should have_many(:genres).through(:movie_genres)}
  end
end
