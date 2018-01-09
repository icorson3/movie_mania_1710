require 'rails_helper'

describe Movie do
  describe "Relationships" do
    it {should have_many(:genres).through(:genre_movies)}
  end
end
