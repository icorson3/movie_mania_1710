require "rails_helper"

describe GenreMovie, type: :model do

  describe "relationships" do
    it {should belong_to(:movie)}
    it {should belong_to(:genre)}
  end
  
end
