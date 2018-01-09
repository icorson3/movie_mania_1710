describe Director, type: :model do
  it {should have_many :movies}

  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:movies)}
  end
end
