require "rails_helper"

describe Movie do 
  context "associations" do 
    it {should have_many :movie_genres}
    it {should have_many :genres}
    it {should belong_to :director}

  end
  context "slug method" do
    it "creates a slug" do 
    director = create(:director)
    movie_1 = Movie.create(title: "Guardians of the Galaxy", description: "great", director_id: director.id, rating: 1, slug: movie_1 )

    expect(movie_1.send(:generate_slug)).to eq "guardians-of-the-galaxy"
    end
  end
end