require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has many genres" do 
    director = Director.create(name: "Steve")
    movie1 = director.movies.create(title: "Guardians of the  Galaxy", description: "people get lost", rating: 10)


    expect(movie1).to respond_to(:genres)
  end
end
