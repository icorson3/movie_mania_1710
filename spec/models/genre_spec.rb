require 'rails_helper'

describe Genre do
  describe "Validations" do
    it {should validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {should have_many(:movies).through(:genre_movies)}
  end

  describe "Instance Methods" do
    it "can calculate average_movie_rating" do
      @genre1 = create(:genre, name: "Action")
      @movie_1 = create(:movie, title: "Guardians of the Galaxy", rating: 80)
      @movie_2 = create(:movie, title: "Suicide Squad", rating: 70)
      @movie_1.genres << @genre1
      @movie_2.genres << @genre1

      expect(@genre1.average_movie_rating).to eq 75
    end
  end

end
