require 'rails_helper'

describe Genre do
  describe "Validations" do
    it {should validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {should have_many(:movies).through(:genre_movies)}
  end

end
