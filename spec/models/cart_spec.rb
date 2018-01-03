require 'rails_helper'

describe Cart do
  subject { Cart.new({"1" => 2, "2" => 3}) }

  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      cart = Cart.new({"1" => 2, "2" => 3})
      expect(cart.total_count).to eq(5)

    end

    it "can add a movie" do
      subject.add_movie(1)
      subject.add_movie(2)

      expect(subject.cart_contents).to eq({"1" => 3, "2" => 4})
    end

    it "can count each movie" do
      expect(subject.count_of(1)).to eq(2)
      expect(subject.count_of(2)).to eq(3)
    end
  end
end
