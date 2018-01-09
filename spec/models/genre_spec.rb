describe Genre do
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
end
