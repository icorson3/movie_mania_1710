require "rails_helper"

describe Genre, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:movies).through(:genre_movies)}
    it {should have_many(:genre_movies)}
  end

  describe "#average_rating" do
    it "gets the average rating " do
      director = create(:director)
      @gog = director.movies.create(title:"Guardians of the Galaxy", rating: 5)
      @ss = director.movies.create(title:"Suicide Squad", rating: 15)
      @action = Genre.create(name:"action")
      GenreMovie.create!(genre: @action, movie:@gog)
      GenreMovie.create!(genre: @action, movie:@ss)

      expect(@action.average_rating).to eq(10)
    end
  end

end
