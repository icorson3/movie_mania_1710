describe Genre do
  it {should have_many :genre_movies}
  it {should have_many :movies}

  describe "validations" do
    it "must have a name" do
      expect(Genre.new).to be_invalid
    end

    it "must have a unique name" do
      create(:genre, name: "Sci Fi")
      genre = Genre.new(name: "Sci Fi")

      expect(genre).to be_invalid
    end
  end

  describe "instance methods" do
    describe "#average_rating" do
      it "returns the average rating" do
        guardians = create(:guardians, rating: 5)
        suicide_squad = create(:movie, title: "Suicide Squad", rating: 0)
        action = create(:genre, name: "Action")
        action.movies << [guardians, suicide_squad]

        expect(action.average_rating).to eq(2.5)
      end
    end
  end
end
