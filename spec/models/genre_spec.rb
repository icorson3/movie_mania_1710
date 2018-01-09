require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "has many movies" do 
    genre = Genre.create(name: "comedy")

    expect(genre).to respond_to(:movies)
  end
end
