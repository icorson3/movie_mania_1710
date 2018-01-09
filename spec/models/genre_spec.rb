require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "validations" do
    it "cant save without a name" do
      genre = Genre.new

      expect(genre).to be_invalid

    end

    it "can save with a name" do
      genre = Genre.new(name: "TYJSDLFKJSLFDJ")

      expect(genre).to be_valid
    end
  end
end
